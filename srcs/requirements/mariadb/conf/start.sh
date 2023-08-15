#!/bin/sh

# Avvia il server MariaDB
mysqld --user=mysql --skip-networking --skip-grant-tables  &

# Attendere che il server MariaDB sia in esecuzione
until mysqladmin ping &>/dev/null; do
    sleep 1
done

# Esegue lo script SQL di inizializzazione
mysql -u root <<EOF
CREATE DATABASE wordpress;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_USER.* TO '$MYSQL_USER'@'%';
FLUSH PRIVILEGES;
EOF

# Ferma il server MariaDB
mysqladmin shutdown

# Avvia il server MariaDB normalmente
exec mysqld --user=mysql
