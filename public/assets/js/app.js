'use strict';

/**
 * GLR Beroeps2 — JavaScript starter (Vanilla ES6+, geen build-stap nodig).
 */

document.addEventListener('DOMContentLoaded', () => {
    const button = document.getElementById('js-check');
    const output = document.getElementById('js-output');

    if (button && output) {
        button.addEventListener('click', () => {
            output.textContent = 'JavaScript werkt ✔';
        });
    }
});

/**
 * Voorbeeld: JSON ophalen uit een eigen PHP-endpoint met fetch().
 * Haal het commentaar weg en pas de URL aan zodra je een endpoint hebt,
 * bijv. public/api/articles.php.
 *
 * async function fetchJson(url) {
 *     const response = await fetch(url, { headers: { Accept: 'application/json' } });
 *     if (!response.ok) {
 *         throw new Error(`Serverfout: ${response.status}`);
 *     }
 *     return response.json();
 * }
 *
 * fetchJson('api/articles.php?genre=hiphop')
 *     .then((articles) => console.log(articles))
 *     .catch((error) => console.error(error));
 */
