FROM alpine:3.17

RUN apk update && apk add --no-cache php81 php81-fpm php81-mysqli php81-redis && rm -rf /var/cache/apk/*

COPY conf/php.ini /etc/php81/conf.d/50-setting.ini

COPY tools/wp_init.sh /

CMD ["./wp_init.sh"]