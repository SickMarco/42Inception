#!/bin/sh

adduser -D -h /home/$FTP_USER -s /sbin/nologin $FTP_USER  && echo "$FTP_USER:$FTP_USER_PASS" | chpasswd
mkdir -p /home/$FTP_USER/ftp
chown -R $FTP_USER:$FTP_USER /home/$FTP_USER/ftp /ftp

vsftpd /etc/vsftpd/vsftpd.conf