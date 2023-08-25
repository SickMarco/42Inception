FROM alpine:3.17

RUN apk update && apk --no-cache add vsftpd && rm -rf /var/cache/apk/*

COPY conf/vsftpd.conf /etc/vsftpd/vsftpd.conf

COPY tools/ftp.sh /ftp.sh

CMD ["./ftp.sh"]
