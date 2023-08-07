FROM alpine:3.17

RUN apk add --no-cache mariadb mariadb-client

RUN chown -R mysql:mysql /var/lib/mysql

#ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
#ENV MYSQL_USER=${MYSQL_USER}
#ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}

CMD ["mysqld"]
