#!/bin/sh

ADMIN_USER=$(head -n 1 /run/secrets/ADMIN_USER | tr -d '\n') 
ADMIN_PASS=$(tail -n 1 /run/secrets/ADMIN_USER | tr -d '\n')

echo "$ADMIN_USER:$ADMIN_PASS" | chpasswd

exec /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf
