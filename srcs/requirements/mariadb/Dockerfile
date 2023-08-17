FROM alpine:3.17

RUN apk update && apk add --no-cache mariadb mariadb-client && rm -rf /var/cache/apk/*

COPY conf/my.cnf /etc/mysql/my.cnf

COPY tools/start.sh /db/start.sh

CMD ["/db/start.sh"]