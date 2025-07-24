#!/bin/sh

sleep 10

cd /www

ADMIN_USER=$(head -n 1 /run/secrets/ADMIN_USER | tr -d '\n') 
ADMIN_PASS=$(tail -n 1 /run/secrets/ADMIN_USER | tr -d '\n')

wp user get "$ADMIN_USER" >/dev/null 2>&1 ||                                    \
wp core install                                                                 \
        --url="$DOMAIN"                                                         \
        --title="franaivo"                                                      \
        --admin_user="$ADMIN_USER"                                              \
        --admin_password="$ADMIN_PASS"                                          \
        --admin_email="change@this.com"      

NORMAL_USER=$(head -n 1 /run/secrets/NORMAL_USER | tr -d '\n')
NORMAL_PASS=$(tail -n 1 /run/secrets/NORMAL_USER | tr -d '\n')

wp user get "$NORMAL_USER" >/dev/null 2>&1 ||                                    \
wp user create  "$NORMAL_USER"                                                  \
                "normal@42.fr" --role=subscriber --user_pass="$NORMAL_PASS"

exec php-fpm83 -F -R
