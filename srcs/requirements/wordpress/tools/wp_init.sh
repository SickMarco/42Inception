#!/bin/sh

if [ ! -d /var/www/html/wp-admin ]; then
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/html --strip-components=1
rm latest.tar.gz

cat << EOF > wp-config.php
<?php

define('DB_NAME', '$MYSQL_DATABASE');
define('DB_USER', '$MYSQL_USER');
define('DB_PASSWORD', '$MYSQL_PASSWORD');
define('DB_HOST', 'db');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', 'utf8_general_ci');
define( 'WP_DEBUG', true );
EOF

echo '$table_prefix' = "'wp_';" >> wp-config.php

cat << EOF >> wp-config.php
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}
require_once ABSPATH . 'wp-settings.php';
?>
EOF

mv wp-config.php /var/www/html
fi

mkdir -p /var/log/php-fpm/ /run/php-fpm/
sed -i 's/127.0.0.1:9000/0.0.0.0:9000/g' /etc/php81/php-fpm.d/www.conf
php-fpm81 --nodaemonize