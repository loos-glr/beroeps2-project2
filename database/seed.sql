-- ============================================================
-- GLR Beroeps2 — testdata voor lokaal ontwikkelen (DBngin)
-- ============================================================
-- Importeer NA schema.sql. Alleen voor lokaal gebruik: zet deze
-- testdata niet op de productie-database van Plesk.
-- Vervang de demo-rijen door testdata voor jullie eigen tabellen.
-- ============================================================

INSERT INTO status_checks (label) VALUES
    ('PHP-server draait'),
    ('Verbinding met MySQL werkt'),
    ('schema.sql en seed.sql zijn geïmporteerd');
