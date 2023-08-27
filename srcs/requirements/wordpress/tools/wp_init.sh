#!/bin/sh

if [ ! -d /var/www/html/wp-admin ]; then

wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/html --strip-components=1 > /dev/null
rm latest.tar.gz

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

envsubst '${MYSQL_DATABASE} ${MYSQL_USER} ${MYSQL_PASSWORD}' < wp-config.php > /var/www/html/wp-config.php

cd /var/www/html
wp core install --url=https://localhost --title="${WP_TITLE}" --admin_user="${WP_ADMIN}" --admin_password="${WP_PASS}" --admin_email="${WP_EMAIL}"
wp plugin install redis-cache --activate
wp redis enable

addgroup wpgroup
chown -R :wpgroup /var/www/html
fi

rm /wp-config.php
mkdir -p /var/log/php-fpm/ /run/php-fpm/
sed -i 's/127.0.0.1:9000/0.0.0.0:9000/g' /etc/php81/php-fpm.d/www.conf
php-fpm81 --nodaemonize