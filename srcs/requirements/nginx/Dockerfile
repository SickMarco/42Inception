FROM alpine:3.17

RUN apk update && apk --no-cache add nginx openssl && rm -rf /var/cache/apk/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]