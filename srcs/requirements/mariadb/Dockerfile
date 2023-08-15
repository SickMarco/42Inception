FROM alpine:3.17

RUN apk update && apk add --no-cache mariadb mariadb-client && rm -rf /var/cache/apk/*

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /var/lib/mysql /run/mysqld

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./conf/start.sh /db/start.sh

RUN mysql_install_db --basedir=/usr --datadir=/var/lib/mysql -v

USER mysql:mysql

CMD ["/db/start.sh"]
