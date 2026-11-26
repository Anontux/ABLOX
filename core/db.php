<?php
define('DB_SERVER', getenv('DB_SERVER') ?: '127.0.0.1');
define('DB_USERNAME', getenv('DB_USERNAME') ?: 'nounblox');
define('DB_PASSWORD', getenv('DB_PASSWORD') ?: 'nounblox');
define('DB_NAME', getenv('DB_NAME') ?: 'nounblox');

$link = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_NAME);
