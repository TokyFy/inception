#!/bin/sh

mkdir -p secrets

if [ ! -f "srcs/.env" ]; then
    echo "DOMAIN=" >> secrets/.env
    echo "DB_NAME" >> secrets/.env
    echo "DB_HOST" >> secrets/.env
fi

touch secrets/ADMIN_USER 
touch secrets/NORMAL_USER 
touch secrets/DB_USER 
