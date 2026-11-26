# Running NOUNBLOX locally

Legacy PHP site (PHP 7.4, mysqli) backed by MySQL 8. There is no build step and
no framework — every page is a plain `.php` file served from the repository root.

## Start

```
docker compose --project-name app -f docker-compose.base44.yml up -d --build
```

* `web` — PHP 7.4 built-in server on port 3000, bind-mounted at `/var/www/html`,
  so source edits show up on the next request (no rebuild needed).
* `db` — MySQL 8. The schema dump (`m34533_nounblx (1).sql`) and `db/seed.sql`
  are loaded **once**, when the `dbdata` volume is first created.
  To start over with a clean database: `docker compose ... down -v`.

## Things that are easy to trip over

* **URLs end in `.aspx`.** The site's links are ASP.NET style (`/Games.aspx`,
  `/my/home.aspx`). `router.php` maps them onto the matching `.php` file and
  changes into that file's directory first, because pages include their
  neighbours with relative paths (`require("../core/header.php")`). Without the
  `chdir`, anything under `my/` or `Forum/` fatals.
* **Database credentials come from the environment** (`DB_SERVER`, `DB_USERNAME`,
  `DB_PASSWORD`, `DB_NAME`), read in `core/db.php`. They are set by the compose
  file; nothing is hardcoded.
* **MySQL runs with an empty `sql_mode`.** The dump uses `0000-00-00` dates and
  the legacy INSERTs rely on implicit defaults, both of which MySQL 8's default
  strict mode rejects.
* **There is no RCC render service.** Avatar and place thumbnails come from
  `users.thumb` / `games.thumbnail`; when those are empty the pages fall back to
  the static images under `/images`. A `thumbnail` value starting with `/` is
  served as a URL (`thumbs/index.php`), which is how the seeded places point at
  the artwork in the repository root.
* **"Play" still needs the Windows client** (`client/nounbloxinstaller.exe` and
  the `nounblox://` URI handler). Games can be browsed, but not played in the
  browser.

## Verify

```
curl -s -o /dev/null -w '%{http_code}\n' http://localhost:3000/Default.aspx
```

Home, `Games.aspx`, `Catalog.aspx`, `Place.aspx?id=1`, `item.aspx?id=1`,
`User.aspx?ID=2`, `Forum/Default.aspx` and `Login/NewAge.aspx` all render without
a PHP error. Registering through `Login/NewAge.aspx` creates the account and logs
it in; `my/home.aspx` redirects to the login page when signed out.
