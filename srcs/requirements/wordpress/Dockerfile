FROM alpine:3.17

RUN apk update && apk add --no-cache php81 php81-fpm php81-mysqli && rm -rf /var/cache/apk/*

#COPY conf/php-fmp.conf /etc/php81/php-fpm.d/php-fmp.conf

RUN mkdir -p /var/log/php-fpm/ /run/php-fpm/

RUN sed -i 's/127.0.0.1:9000/0.0.0.0:9000/g' /etc/php81/php-fpm.d/www.conf

CMD ["php-fpm81", "--nodaemonize"]