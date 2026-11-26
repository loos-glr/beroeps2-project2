<?php
declare(strict_types=1);

/**
 * Configuratie & databaseverbinding.
 *
 * Staat bewust buiten de publieke webroot (/public), zodat deze code nooit
 * rechtstreeks via de browser opgevraagd kan worden.
 *
 * De instellingen komen uit het .env-bestand in de root van de repository
 * (Twelve-Factor App, factor III: config in de omgeving). Lokaal maak je dit
 * bestand aan vanuit .env.example; op Plesk plaats je een eigen productie-.env.
 * Het .env-bestand staat in .gitignore en mag NOOIT in Git komen.
 */

/**
 * Leest een .env-bestand in en vult $_ENV en getenv().
 * Bestaande omgevingsvariabelen (bijv. vanuit de server) worden niet overschreven.
 */
function loadEnv(string $path): void
{
    if (!is_readable($path)) {
        return;
    }

    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    if ($lines === false) {
        return;
    }

    foreach ($lines as $line) {
        $line = trim($line);

        // Commentaar en regels zonder '=' overslaan.
        if ($line === '' || $line[0] === '#' || !str_contains($line, '=')) {
            continue;
        }

        [$key, $value] = explode('=', $line, 2);
        $key = trim($key);
        $value = trim($value);

        // Omringende aanhalingstekens verwijderen.
        if (strlen($value) >= 2) {
            $first = $value[0];
            $last = $value[strlen($value) - 1];
            if (($first === '"' || $first === "'") && $first === $last) {
                $value = substr($value, 1, -1);
            }
        }

        if ($key === '' || getenv($key) !== false) {
            continue;
        }

        $_ENV[$key] = $value;
        putenv($key . '=' . $value);
    }
}

/**
 * Geeft een configuratiewaarde terug uit de omgeving.
 */
function env(string $key, ?string $default = null): ?string
{
    $value = $_ENV[$key] ?? getenv($key);

    return ($value === false || $value === null) ? $default : (string) $value;
}

// .env staat in de root van de repository: twee mappen boven src/config/.
loadEnv(dirname(__DIR__, 2) . '/.env');

/**
 * Geeft een PDO-verbinding met MySQL terug (hergebruikt binnen één request).
 *
 * Gooit een PDOException als verbinden mislukt; vang die op in de aanroeper
 * en toon de gebruiker nooit de technische foutmelding.
 *
 * Gebruik altijd prepared statements:
 *   $stmt = getDatabaseConnection()->prepare('SELECT * FROM users WHERE id = :id');
 *   $stmt->execute(['id' => $id]);
 */
function getDatabaseConnection(): PDO
{
    static $pdo = null;

    if ($pdo instanceof PDO) {
        return $pdo;
    }

    $host = env('DB_HOST', '127.0.0.1');
    $port = env('DB_PORT', '3306');
    $name = env('DB_NAME', '');
    $user = env('DB_USER', 'root');
    $pass = env('DB_PASS', '');

    $dsn = sprintf('mysql:host=%s;port=%s;dbname=%s;charset=utf8mb4', $host, $port, $name);

    $pdo = new PDO($dsn, $user, $pass, [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ]);

    return $pdo;
}
