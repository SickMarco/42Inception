#!/bin/sh

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]; then

mysql_install_db --defaults-file=/etc/mysql/my.cnf

cat << EOF > /var/lib/mysql/init.sql
USE mysql;
FLUSH PRIVILEGES;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
EOF

mysqld --bootstrap < /var/lib/mysql/init.sql
rm -f /var/lib/mysql/init.sql
fi

mysqld_safe --defaults-file=/etc/mysql/my.cnf
