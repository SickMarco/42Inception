FROM alpine:3.17

RUN apk update && apk add --no-cache redis && rm -rf /var/cache/apk/*

COPY conf/redis.conf /redis.conf

CMD ["redis-server", "/redis.conf"]