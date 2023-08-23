FROM alpine:3.17

RUN apk update && apk --no-cache add nginx && rm -rf /var/cache/apk/*

COPY html /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]