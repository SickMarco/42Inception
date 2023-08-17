#!/bin/sh

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]; then
mysql_install_db --user=root

cat << EOF > init.sql
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
EOF

mysqld --user=root --bootstrap < init.sql

rm -f init.sql
fi

mysqld --user=root
