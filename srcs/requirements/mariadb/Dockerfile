FROM alpine:3.17

RUN apk update && apk add --no-cache mariadb mariadb-client && rm -rf /var/cache/apk/*

COPY conf/my.cnf /etc/mysql/my.cnf

COPY tools/start.sh /db/start.sh

RUN mkdir -p /run/mysqld /var/log/mysql && chown -R mysql:mysql /var/lib/mysql /run/mysqld /var/log/mysql

USER mysql

CMD ["/db/start.sh"]