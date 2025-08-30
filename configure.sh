#!/bin/sh

mkdir -p secrets

if [ ! -f "srcs/.env" ]; then
    echo  "DOMAIN=" >> srcs/.env
    echo "DB_NAME=" >> srcs/.env
    echo "DB_HOST=" >> srcs/.env
fi

touch secrets/ADMIN_USER 
touch secrets/NORMAL_USER 
touch secrets/DB_USER 
