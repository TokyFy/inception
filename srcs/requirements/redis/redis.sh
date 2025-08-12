#!/bin/sh

ADMIN_USER=$(head -n 1 /run/secrets/ADMIN_USER | tr -d '\n') 
ADMIN_PASS=$(tail -n 1 /run/secrets/ADMIN_USER | tr -d '\n')

sed -i "s/REDIS_USER/$ADMIN_USER/g" /etc/redis.conf
sed -i "s/REDIS_PASS/$ADMIN_PASS/g" /etc/redis.conf

exec redis-server /etc/redis.conf

