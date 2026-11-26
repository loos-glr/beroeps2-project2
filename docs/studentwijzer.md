# Studentwijzer: BEROEPS2

**Mobile-First Design Handoff** · Creative Software Developer (BOL 4), leerjaar 2, module 2

**Omvang:** 8 weken × 5 uur = 40 contacturen (4 uur Beroeps2 + 1 uur PROCES2 per week)

**Beoordeling:** Matig / Voldoende / Goed (geen cijfers)

Jullie bouwen in teams een mobiele webapp op basis van een bestaand projectplan (UX-onderzoek, MoSCoW-eisen,
Mermaid-flows en een klikbaar Figma-prototype). Dat plan is jullie **UX-to-Dev Handoff**: jullie hoeven het
concept niet meer te bedenken, maar maken het technisch waar.

## Team en rollen

- **Groepsgrootte:** gemiddeld 3, maximaal 4 studenten.
- **Hoedersrollen:** Lead Product & Backlog · Lead UX & Mobile CSS · Lead Backend & Data · Lead Git, QA & Deployment.
  Een rol betekent *eindverantwoordelijkheid voor het bewaken* van dat onderdeel, niet dat jij het alleen doet.
- **Individuele eis:** iedere student pakt aantoonbaar **zowel front-end als back-end/data** op, dient Pull Requests
  in én reviewt de code van groepsgenoten. "Dat was niet mijn rol" telt niet.
- Afwijken van het projectplan mag, mits je het **vooraf pitcht**, het wordt goedgekeurd en je het vastlegt in
  `docs/technisch-ontwerp.md`.

## De 3 deelopleveringen

### Deeloplevering 1: Project Kickstart & Architectuur (einde week 2, 10 uur)

1. Starter-repo ingericht, lokaal draaiend via DBngin + `dev.sh`, met actieve CODEOWNERS en branch protection.
2. **Testronde 1** uitgevoerd met het Figma-prototype bij externe proefpersonen en vastgelegd in `docs/testrapport.md`.
3. **Technisch Ontwerp** (`docs/technisch-ontwerp.md`) met kloppend ERD, bestandsstructuur en eventuele goedgekeurde scope-afwijkingen.
4. Gevulde **GitHub Backlog** gekoppeld aan de E-codes, met acceptatiecriteria voor Sprint 1.

### Deeloplevering 2: Sprint 1 Review, Mobile MVP Live (einde week 5, 25 uur)

1. Alle **Must-have** eisen werken end-to-end (inclusief MySQL-opslag en -uitlezen) op mobiel formaat (375px, geen horizontale scroll).
2. De MVP staat **live op de GLR Plesk-server** en wordt in de review via telefoon/QR-code gedemonstreerd.
3. **Individuele Git- en PR-peiling:** controle op commits en code reviews per groepslid. Achterblijvers krijgen direct bijsturing voor Sprint 2.

### Deeloplevering 3: Einddemo & Code Walkthrough (week 8, 40 uur)

1. Volledige applicatie live op Plesk: Musts + gerealiseerde Should/Coulds, netjes opgeschaald naar tablet/desktop via `min-width` queries.
2. **Testronde 2** uitgevoerd met externe gebruikers op echte telefoons, inclusief doorgevoerde verbeteringen in de code.
3. **Individueel code-gesprek (5–10 min p.p.):** je licht je eigen front- en back-end PR's en de gezamenlijke werking mondeling toe.

## Weekplanning

| Week | Thema | Kerntaak |
| --- | --- | --- |
| 1 | Usability Testing (Ronde 1) & keuzes maken: testen op telefoon met het Figma-prototype (T1–T5), inzichten en eisen (E1–E8) omzetten naar GitHub Issues | P1-K1, P4-K1 |
| 2 | Git Workflow, CODEOWNERS & GitHub CI: branch protection, feature branches, CI-check lezen, merge-conflict oplossen | P1-K1, P3-K1 |
| 3 | Mobile-First CSS & Peer Code Review: vanaf 375px, `min-width`, touch-targets min. 44×44px, feedback op elkaars eerste PR | P2-K1, P3-K1 |
| 4 | Gestructureerde Git Deployment naar Plesk: `schema.sql` importeren, productie-`.env`, Document Root op `/public` | P3-K1 |
| 5 | Sprint Retrospective & Rolevaluatie (Start / Stop / Continue) | P1-K1, [H] |
| 6 | Data-validatie, Security & Edge Cases: prepared statements, foutieve invoer, sessie-/rolrechten | P3-K1, P4-K1 |
| 7 | Mobile Device Testing (Ronde 2) & Bug Triage: 5–6 externe proefpersonen, netwerk-throttling | P4-K1 |
| 8 | Einddemo & individuele code walkthrough | P1 t/m P4 |

**Buiten deze module:** Test Driven Development, geautomatiseerde browser-tests (Playwright/Cypress) en
automatische webhook-deployments.

## Beoordeling

**Matig:** nog niet op het vereiste niveau van leerjaar 2, herstel nodig.
**Voldoende:** vakbekwaam volgens de standaard.
**Goed:** overstijgt de standaard in uitvoering, complexiteit of diepgang.

> **Slagings- en individu-regel**
> Criteria 1 t/m 4 beoordelen de gezamenlijke deelopleveringen. Criterium 5 is de **individuele poortwachter** en kan
> het eindoordeel per student naar beneden of boven bijstellen. Voor het eindoordeel **Voldoende** mag criterium 5
> nooit *Matig* zijn en mag **maximaal één** van de criteria 1 t/m 4 *Matig* zijn.

| Criterium (SBB) | Matig | Voldoende | Goed |
| --- | --- | --- | --- |
| **1. Voorbereiding, Backlog & Technisch Ontwerp** (Deeloplevering 1; P1-K1, P2-K1) | Backlog is vaag of mist koppeling met de E-codes. ERD of technisch ontwerp ontbreekt of wijkt volledig af van de gebouwde database. | Alle eisen zijn vertaald naar heldere GitHub Issues met acceptatiecriteria. Technisch ontwerp (ERD en mappen-/paginastructuur) is logisch en sluit aan op de realisatie. | Issues bevatten scherpe Given-When-Then criteria; het technisch ontwerp is strak gedocumenteerd en wordt gedurende het project actief bijgewerkt. |
| **2. Mobile-First Realisatie & UX** (Deeloplevering 2 & 3; P2-K1, P3-K1) | Eerst voor desktop gebouwd, waardoor mobiel (375px) breekt of horizontaal scrolt; knoppen zijn te klein. Huisstijl uit het plan is niet herkenbaar. | Opgebouwd met Mobile-First CSS (`min-width` queries), werkt soepel op telefoon en schaalt netjes op. Voldoet aan de huisstijl en alle Must-have eisen. | Voelt aan als een doordachte mobiele webapp (fijne touch-states, toegankelijk conform WCAG) en realiseert naast alle Musts ook overtuigend de Should/Could-eisen. |
| **3. Full-Stack Code, Data & Deployment** (Deeloplevering 2 & 3; P3-K1) | Onveilige queries (SQL-injectie mogelijk), wachtwoorden hardcoded in Git, of de applicatie draait niet op de Plesk-server bij de oplevermomenten. | Nette scheiding tussen HTML, CSS, JS en PHP (`/public` en `/src`), veilige PDO-queries, gebruik van `.env`, en in week 5 én week 8 stabiel live op Plesk. | Schone, modulaire code met sterke validatie en foutafhandeling; succesvolle uitwerking van complexe onderdelen (zoals RBAC/beveiliging of asynchrone `fetch()`-flows). |
| **4. Gebruikerstesten & Git/CI Workflow** (Deeloplevering 1, 2 & 3; P3-K1, P4-K1) | Testronde 1 of 2 is onvolledig of op eigen groepsleden getest; er wordt direct naar `main` gepusht, of PR-reviews en falende CI-checks worden genegeerd. | Testronde 1 (Figma) en 2 (live app) zijn uitgevoerd met externe proefpersonen volgens T1–T5; bevindingen zijn verwerkt. Consequent gebruik van PR's, groene CI en CODEOWNERS. | Testrapport verbindt observaties scherp aan aantoonbare UX-/codeverbeteringen; PR's tonen inhoudelijk sterke peer-reviews en een schone commit-historie. |
| **5. Individuele Codevaardigheid & Bijdrage** (week 5 peiling & week 8 walkthrough; individueel) | Student heeft nauwelijks functionele code geleverd, verschuilt zich achter een rol, of kan tijdens het eindgesprek de eigen code niet zelfstandig uitleggen. | Student heeft aantoonbaar bijgedragen aan zowel front-end als back-end/data via eigen PR's, heeft teamcode gereviewd en legt eigen én aangrenzende code helder uit. | Student toont overzicht over de gehele full-stack architectuur, tilt het team omhoog via sterke code reviews en verantwoordt technische keuzes vakinhoudelijk overtuigend. |
