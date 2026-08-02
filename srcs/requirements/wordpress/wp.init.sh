#!/bin/sh

sleep 10 && cd /www  && wp core install                                         \
        --url="$DOMAIN"                                                         \
        --title="franaivo"                                                      \
        --admin_user="$(head -n 1 /run/secrets/ADMIN_USER | tr -d '\n')"        \
        --admin_password="$(tail -n 1 /run/secrets/ADMIN_USER | tr -d '\n')"    \
        --admin_email="change@this.com"                                                        

exec php-fpm83 -F -R
