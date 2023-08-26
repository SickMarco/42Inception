FROM alpine:3.17

RUN apk update && apk --no-cache add wget php81 php81-session php81-mysqli && rm -rf /var/cache/apk/*

WORKDIR /var/www/html

RUN wget https://www.adminer.org/latest.php -O adminer.php

COPY conf/php.ini /etc/php81/php.ini

CMD ["php81", "-S", "0.0.0.0:8080", "adminer.php"]