#!/bin/sh

ADMIN_USER=$(head -n 1 /run/secrets/ADMIN_USER | tr -d '\n') 
ADMIN_PASS=$(tail -n 1 /run/secrets/ADMIN_USER | tr -d '\n')

echo "$ADMIN_USER:$ADMIN_PASS" | chpasswd

chown -R nobody:nogroup /home/franaivo/www
chmod -R 777 /home/franaivo/www

exec /usr/sbin/proftpd -n -c /etc/proftpd/proftpd.conf
