<?php
declare(strict_types=1);

require __DIR__ . '/../src/config/database.php';

/**
 * Starterpagina: laat zien dat de PHP-server en de MySQL-verbinding werken.
 * Vervang deze pagina door de eerste pagina van jullie eigen project.
 */

$dbOk = false;
$checks = [];

try {
    $pdo = getDatabaseConnection();
    $stmt = $pdo->prepare('SELECT id, label FROM status_checks ORDER BY id');
    $stmt->execute();
    $checks = $stmt->fetchAll();
    $dbOk = true;
} catch (PDOException $e) {
    // Toon de gebruiker nooit de technische foutmelding; log hem voor de ontwikkelaar.
    error_log('Databasefout: ' . $e->getMessage());
}
?>
<!DOCTYPE html>
<html lang="nl">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>GLR Beroeps2 Starter</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <header class="site-header">
        <h1>GLR Beroeps2 Starter</h1>
    </header>

    <main class="container">
        <section class="card" aria-labelledby="status-title">
            <h2 id="status-title">Status ontwikkelomgeving</h2>

            <?php if ($dbOk): ?>
                <p class="status status--ok" role="status">✔ Verbonden met MySQL</p>

                <?php if ($checks): ?>
                    <ul class="checklist">
                        <?php foreach ($checks as $check): ?>
                            <li><?= htmlspecialchars($check['label'], ENT_QUOTES, 'UTF-8') ?></li>
                        <?php endforeach; ?>
                    </ul>
                <?php else: ?>
                    <p>De tabel <code>status_checks</code> is leeg. Importeer <code>database/seed.sql</code>.</p>
                <?php endif; ?>
            <?php else: ?>
                <p class="status status--error" role="alert">✘ Geen verbinding met MySQL</p>
                <ol>
                    <li>Draait je database in DBngin (groen icoon)?</li>
                    <li>Kloppen <code>DB_PORT</code>, <code>DB_NAME</code>, <code>DB_USER</code> en <code>DB_PASS</code> in je <code>.env</code>?</li>
                    <li>Heb je <code>database/schema.sql</code> geïmporteerd?</li>
                </ol>
            <?php endif; ?>

            <button type="button" class="button" id="js-check">Test JavaScript</button>
            <p id="js-output" aria-live="polite"></p>
        </section>
    </main>

    <script src="assets/js/app.js"></script>
</body>
</html>
