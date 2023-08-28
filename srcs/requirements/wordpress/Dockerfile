FROM alpine:3.17

RUN apk update && apk add --no-cache php81 php81-fpm php81-mysqli php81-phar php81-mbstring php81-redis php81-ctype gettext && rm -rf /var/cache/apk/*

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

COPY conf/php.ini /etc/php81/conf.d/50-setting.ini

COPY conf/wp-config.php /

COPY tools/wp_init.sh /

CMD ["./wp_init.sh"]