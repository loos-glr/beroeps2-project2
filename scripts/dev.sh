#!/usr/bin/env bash
set -euo pipefail

# Altijd vanuit de root van de repository werken, ongeacht waar het script wordt gestart.
cd "$(dirname "${BASH_SOURCE[0]}")/.."

echo "=== GLR Beroeps2 Lokale Ontwikkelserver ==="

if ! command -v php >/dev/null 2>&1; then
  echo "[FOUT] PHP niet gevonden. Installeer PHP 8.x (op de GLR-iMacs is dit al aanwezig)."
  exit 1
fi

# --- DBngin (alleen macOS) ---------------------------------------------------
# Studenten hebben geen admin-rechten, dus installeren we in ~/Applications
# (de eigen Programma's-map van de gebruiker) in plaats van /Applications.
DBNGIN_FEED_URL="https://dbngin.com/osx/version.xml"
DBNGIN_FALLBACK_URL="https://files.dbngin.com/macos/105/DBngin.dmg"
DBNGIN_TARGET_DIR="${HOME}/Applications"
DBNGIN_TMP=""

dbngin_installed() {
  [ -d "/Applications/DBngin.app" ] && return 0
  [ -d "${DBNGIN_TARGET_DIR}/DBngin.app" ] && return 0
  [ -n "$(mdfind "kMDItemCFBundleIdentifier == 'com.tinyapp.DBngin'" 2>/dev/null | head -n 1 || true)" ]
}

dbngin_cleanup() {
  if [ -n "${DBNGIN_TMP}" ] && [ -d "${DBNGIN_TMP}" ]; then
    if [ -d "${DBNGIN_TMP}/mnt/DBngin.app" ]; then
      hdiutil detach -quiet "${DBNGIN_TMP}/mnt" >/dev/null 2>&1 || true
    fi
    rm -rf "${DBNGIN_TMP}"
  fi
  DBNGIN_TMP=""
}

install_dbngin() {
  local url
  mkdir -p "${DBNGIN_TARGET_DIR}" || return 1
  DBNGIN_TMP="$(mktemp -d)" || return 1
  trap dbngin_cleanup EXIT

  # Nieuwste versie uit de officiële updatefeed halen; anders een bekende versie gebruiken.
  url="$(curl -fsSL "${DBNGIN_FEED_URL}" 2>/dev/null | grep -oE 'url="https://[^"]+\.dmg"' | head -n 1 | cut -d '"' -f 2 || true)"
  url="${url:-${DBNGIN_FALLBACK_URL}}"

  echo "DBngin downloaden van ${url} ..."
  curl -fL --progress-bar -o "${DBNGIN_TMP}/DBngin.dmg" "${url}" || return 1

  echo "DBngin installeren in ${DBNGIN_TARGET_DIR} ..."
  mkdir -p "${DBNGIN_TMP}/mnt"
  hdiutil attach -nobrowse -readonly -quiet -mountpoint "${DBNGIN_TMP}/mnt" "${DBNGIN_TMP}/DBngin.dmg" || return 1
  ditto "${DBNGIN_TMP}/mnt/DBngin.app" "${DBNGIN_TARGET_DIR}/DBngin.app" || return 1

  dbngin_cleanup
  trap - EXIT
}

check_dbngin() {
  local answer=""
  dbngin_installed && return 0

  echo "[LET OP] DBngin (lokale MySQL-server) is niet gevonden."
  if [ -t 0 ]; then
    read -r -p "Wil je DBngin nu installeren in ~/Applications (± 330 MB, geen admin-rechten nodig)? [j/N] " answer || true
  fi

  case "${answer}" in
    [jJyY]*)
      if install_dbngin; then
        echo "[OK] DBngin is geïnstalleerd in ${DBNGIN_TARGET_DIR}/DBngin.app en wordt nu geopend."
        echo "     Maak in DBngin een MySQL-service aan, start die en zet de poort in .env (DB_PORT)."
        open "${DBNGIN_TARGET_DIR}/DBngin.app" || true
      else
        dbngin_cleanup
        trap - EXIT
        echo "[FOUT] Installatie van DBngin is mislukt. Download het handmatig via https://dbngin.com"
        echo "       en sleep DBngin.app naar de map 'Programma's' in je eigen thuismap (~/Applications)."
      fi
      ;;
    *)
      echo "DBngin wordt niet geïnstalleerd. Handmatig downloaden kan via https://dbngin.com"
      ;;
  esac
  echo "-------------------------------------------"
}

if [ "$(uname -s)" = "Darwin" ]; then
  check_dbngin
fi

if [ ! -f .env ]; then
  echo "[LET OP] Geen .env bestand gevonden. Kopie wordt aangemaakt vanuit .env.example..."
  cp .env.example .env
  echo "Pas eerst je DB_PORT en DB_NAME uit DBngin aan in '.env' en start dit script opnieuw."
  exit 1
fi

# Waarden uit .env lezen (alleen APP_PORT is hier nodig).
if [ -z "${APP_PORT:-}" ]; then
  APP_PORT="$(grep -E '^APP_PORT=' .env | head -n 1 | cut -d '=' -f 2- | tr -d "\"' \r" || true)"
fi
PORT="${APP_PORT:-8000}"

echo "1. Controleer of je MySQL-database draait in DBngin (groen status-icoon)."
echo "2. Open je browser op: http://localhost:${PORT}"
echo "3. Zet Chrome DevTools op mobiele weergave (375px breed) voor Mobile-First ontwikkeling."
echo "Druk op Ctrl+C om de server te stoppen."
echo "-------------------------------------------"

php -S "localhost:${PORT}" -t public
