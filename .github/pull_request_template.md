## Wat verandert er?

<!-- Beschrijf kort wat deze Pull Request toevoegt of oplost. -->

Closes #<!-- issuenummer -->
Eis uit het projectplan: E<!-- nummer, bijv. E3 -->

**Soort wijziging:**
- [ ] Front-end (HTML / CSS / JS)
- [ ] Back-end / data (PHP / MySQL)
- [ ] Documentatie (technisch ontwerp, testrapport)

## Hoe test de reviewer dit?

<!-- Stappen om de wijziging lokaal te controleren, bijv.:
1. `git switch <branch>` en `bash scripts/dev.sh`
2. Importeer eventuele wijzigingen in `database/schema.sql` in DBngin
3. Ga naar http://localhost:8000/... in DevTools op 375px
-->

1.
2.

## Screenshot (mobiel, 375px)

<!-- Sleep hier een screenshot in van de mobiele weergave. -->

## Kwaliteitschecklist

**Mobile-First & UX**
- [ ] Getest op 375px breed: geen horizontale scroll
- [ ] Opgeschaald met `min-width` media queries (niet andersom)
- [ ] Knoppen en links zijn minimaal 44×44px (WCAG 2.5.8)
- [ ] Huisstijl/sfeer uit het projectplan is herkenbaar

**Code & Data**
- [ ] Database-queries gebruiken PDO prepared statements (geen variabelen in SQL-strings)
- [ ] Output naar HTML is ge-escaped met `htmlspecialchars()`
- [ ] Formulierinvoer wordt server-side gevalideerd
- [ ] Geen wachtwoorden, `.env` of andere geheimen in de code
- [ ] PHP-logica staat in `/src`, alleen entrypoints en assets in `/public`
- [ ] Wijzigingen in de database staan in `database/schema.sql` (en zo nodig `seed.sql`)

**Proces**
- [ ] CI-check is groen
- [ ] `docs/technisch-ontwerp.md` is bijgewerkt als routes, tabellen of rollen veranderen
- [ ] Ik heb mijn eigen code nog één keer doorgelezen vóór ik review aanvroeg

## Vraag aan de reviewer

<!-- Waar wil je specifiek feedback op? Reviewers: geef inhoudelijke feedback
(wat is goed, wat kan beter en waarom), niet alleen "LGTM". -->
