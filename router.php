<?php
// Router for PHP's built-in web server.
// The site's links use ASP.NET style URLs (/Games.aspx, /my/home.aspx), so map
// them onto the matching .php file. Returning false lets the server handle
// static files (images, css, js) and directory indexes itself.

$path = urldecode(parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
$root = __DIR__;

if (preg_match('#^(.*)\.aspx$#i', $path, $matches)) {
    $target = $root . $matches[1] . '.php';
    if (is_file($target)) {
        // Pages use paths relative to their own folder ("../core/header.php"),
        // the way Apache would run them.
        chdir(dirname($target));
        require $target;
        return true;
    }
}

$target = $root . rtrim($path, '/') . '/index.php';
if (is_file($target)) {
    chdir(dirname($target));
    require $target;
    return true;
}

return false;
