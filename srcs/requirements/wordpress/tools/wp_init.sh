#!/bin/sh

if [ ! -d /var/www/html/wp-admin ]; then

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
cd /var/www/html

wp core download

cat << EOF > wp-config.php
<?php

define('DB_NAME', '$MYSQL_DATABASE');
define('DB_USER', '$MYSQL_USER');
define('DB_PASSWORD', '$MYSQL_PASSWORD');
define('DB_HOST', 'db');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', 'utf8_general_ci');
define( 'WP_DEBUG', true );
define('WP_ALLOW_REPAIR', true);
define('WP_CACHE', true);
define('WP_REDIS_HOST', 'rds');
define('WP_REDIS_PORT', '6379');
EOF

echo '$table_prefix' = "'wp_';" >> wp-config.php

cat << EOF >> wp-config.php
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
?>
EOF

wp core install --url=https://localhost --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}"
wp plugin install redis-cache --activate
wp redis enable
fi

mkdir -p /var/log/php-fpm/ /run/php-fpm/
sed -i 's/127.0.0.1:9000/0.0.0.0:9000/g' /etc/php81/php-fpm.d/www.conf
php-fpm81 --nodaemonize