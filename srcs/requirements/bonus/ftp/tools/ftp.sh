#!/bin/sh

if ! id "$FTP_USER" >/dev/null 2>&1; then
adduser -D -h /ftp -s /sbin/nologin $FTP_USER && echo "$FTP_USER:$FTP_USER_PASS" | chpasswd
chown -R $FTP_USER:$FTP_USER /ftp
fi

vsftpd /etc/vsftpd/vsftpd.conf