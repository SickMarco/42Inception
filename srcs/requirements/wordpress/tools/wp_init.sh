#!/bin/sh

if [ ! -d /var/www/html/wp-admin ]; then
wget https://wordpress.org/latest.tar.gz
tar -xzvf latest.tar.gz -C /var/www/html --strip-components=1
rm latest.tar.gz
fi

mkdir -p /var/log/php-fpm/ /run/php-fpm/
sed -i 's/127.0.0.1:9000/0.0.0.0:9000/g' /etc/php81/php-fpm.d/www.conf
php-fpm81 --nodaemonize