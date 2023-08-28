#!/bin/sh

if [ ! -d /var/www/html/wp-admin ]; then

envsubst '${MYSQL_DATABASE} ${MYSQL_USER} ${MYSQL_PASSWORD}' < wp-config.php > /var/www/html/wp-config.php
cd /var/www/html
wp core download
wp core install --url=https://localhost --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}"
wp plugin install redis-cache --activate
wp redis enable

addgroup wpgroup
chown -R :wpgroup /var/www/html
fi

rm -f /wp-config.php
mkdir -p /var/log/php-fpm/ /run/php-fpm/
sed -i 's/127.0.0.1:9000/0.0.0.0:9000/g' /etc/php81/php-fpm.d/www.conf
php-fpm81 --nodaemonize