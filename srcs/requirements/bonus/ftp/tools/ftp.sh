#!/bin/sh

if ! id "$FTP_USER" >/dev/null 2>&1; then
addgroup wpgroup
adduser -D -h /ftp -s /sbin/nologin $FTP_USER && echo "$FTP_USER:$FTP_USER_PASS" | chpasswd
addgroup $FTP_USER wpgroup
fi

vsftpd /etc/vsftpd/vsftpd.conf