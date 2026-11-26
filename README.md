# GLR Beroeps2 Starter

Starter-template voor de module **BEROEPS2: Mobile-First Design Handoff**
(Creative Software Developer, leerjaar 2, Grafisch Lyceum Rotterdam).

Stack: 
- semantische HTML5
- Mobile-First CSS
- Vanilla JavaScript (ES6+)
- PHP 8.x (PDO) en MySQL.

Je ontwikkelt **lokaal** en releaset gestructureerd naar de GLR Plesk-server.

> Beoordeling, deelopleveringen en weekplanning staan in [docs/studentwijzer.md](docs/studentwijzer.md).

## Snel starten (lokaal)

Benodigd: PHP 8.x (staat op de GLR-iMacs), [DBngin](https://dbngin.com) en Git.
Ontbreekt DBngin op je Mac? Dan biedt `bash scripts/dev.sh` aan om het automatisch te installeren in `~/Applications`
(geen admin-rechten nodig).

1. **Maak je repository** via *Use this template* op GitHub (één repository per team) en clone die.
2. **Start MySQL in DBngin** en maak een database aan (bijv. `beroeps2`). Let op de poort van je service.
3. **Configuratie:** voer `bash scripts/dev.sh` uit. Bij de eerste keer maakt het script een `.env` aan vanuit
   `.env.example`. Pas `DB_PORT`, `DB_NAME` (en indien nodig `DB_USER`/`DB_PASS`) aan en start het script opnieuw.
4. **Importeer de database** in je DBngin-database (bijv. via TablePlus of de terminal):
   ```bash
   mysql -h 127.0.0.1 -P <DB_PORT> -u root <DB_NAME> < database/schema.sql
   mysql -h 127.0.0.1 -P <DB_PORT> -u root <DB_NAME> < database/seed.sql
   ```
5. **Start de server:** `bash scripts/dev.sh` en open <http://localhost:8000>.
6. **Zet Chrome DevTools op mobiele weergave (375px)**: bouw altijd eerst voor mobiel.

Op de startpagina zie je of de verbinding met MySQL werkt. Werkt het? Vervang dan de demo-code door jullie eigen project.

## Mappenstructuur

```
.github/            CODEOWNERS, PR-template, issue-templates en CI (ci-quality.yml)
database/           schema.sql (tabellen) en seed.sql (testdata voor lokaal)
docs/               projectplan/, technisch-ontwerp.md, testrapport.md, studentwijzer.md
public/             document root (lokaal via dev.sh én op Plesk)
  assets/css|js/    style.css (Mobile-First, 375px) en app.js
  index.php         publiek entrypoint
src/                PHP-logica en classes, buiten de publieke webroot
  config/database.php   PDO-verbinding op basis van .env
scripts/dev.sh      start de lokale PHP-server
.env.example        voorbeeldconfiguratie (het echte .env komt nooit in Git)
```

Alleen wat de browser rechtstreeks mag opvragen hoort in `public/`. PHP-logica, configuratie en
`.env` staan daarbuiten.

## Samenwerken met Git

- Werk **nooit rechtstreeks op `main`**: maak per taak een feature branch (`feature/e3-bestelflow`).
- Elke wijziging gaat via een **Pull Request** met de ingevulde checklist.
- `CODEOWNERS` wijst je groepsgenoten automatisch aan als reviewer. Geef inhoudelijke feedback.
- De **CI-check** moet groen zijn: PHP-syntaxcontrole en controle dat er geen `.env` in Git staat.

### Eenmalig in week 1–2: teamafspraken instellen

1. Vervang de placeholders in [.github/CODEOWNERS](.github/CODEOWNERS) door de GitHub-accounts van alle teamleden.
2. Stel een **Branch Protection Rule** in op `main` (*Settings → Branches*):
   - Require a pull request before merging, met minimaal 1 approval
   - Require review from Code Owners
   - Require status checks to pass: `lint-and-verify`
3. Zet jullie backlog op met de issue-templates (*Issues → New issue*), gekoppeld aan de E-codes uit het projectplan.
4. Kopieer jullie gekozen projectplan naar `docs/projectplan/`.

## Plesk release-checklist (Week 4)

Gebruik dit bij elke release naar de GLR Plesk-server.

- [ ] **Document Root** van het domein staat op `/public` (Plesk → *Hosting & DNS → Hosting-instellingen*)
- [ ] **Database** aangemaakt in Plesk en `database/schema.sql` geïmporteerd (phpMyAdmin → *Importeren*).
      Importeer `seed.sql` **niet** op productie.
- [ ] **Productie-`.env`** aangemaakt in de **root van de repository op de server** (dus *naast* `public/`, niet erin)
      met de Plesk-databasegegevens en `APP_ENV=production`
- [ ] Code via **Git** op Plesk uitgerold (*Git → Pull/Deploy*) vanaf `main`
- [ ] **Rooktest op een echte telefoon** (QR-code): pagina laadt, data komt uit MySQL, geen horizontale scroll
- [ ] Geen foutmeldingen of wachtwoorden zichtbaar voor de gebruiker

## Veelvoorkomende problemen

| Probleem | Oplossing |
| --- | --- |
| "Geen verbinding met MySQL" | Draait de service in DBngin? Klopt `DB_PORT` in `.env`? |
| `.env` bestaat niet | Voer `bash scripts/dev.sh` één keer uit, of `cp .env.example .env` |
| Poort 8000 is bezet | Zet `APP_PORT=8001` in `.env` |
| CI faalt op `.env` | Verwijder `.env` uit Git: `git rm --cached .env` |
