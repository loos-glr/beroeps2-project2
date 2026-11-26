-- ============================================================
-- GLR Beroeps2 — database schema
-- ============================================================
-- Importeer dit bestand lokaal in je DBngin-database en op
-- productie via Plesk (phpMyAdmin → Importeren).
--
-- Gebruik "IF NOT EXISTS" zodat importeren veilig herhaald kan worden.
-- Vervang de demo-tabel hieronder door de tabellen uit jullie ERD
-- (zie docs/technisch-ontwerp.md) en houd dit bestand altijd gelijk
-- aan de werkelijke database.
-- ============================================================

-- Demo-tabel: wordt gebruikt door public/index.php om te laten zien
-- dat de verbinding met MySQL werkt. Verwijder zodra jullie eigen
-- tabellen er staan.
CREATE TABLE IF NOT EXISTS status_checks (
    id         INT UNSIGNED NOT NULL AUTO_INCREMENT,
    label      VARCHAR(100) NOT NULL,
    created_at TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
