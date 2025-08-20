#!/bin/sh
set -e

mariadbd &
MARIADB_PID=$!

DB_USER=$(head -n 1 /run/secrets/DB_USER | tr -d '\n') 
DB_PASS=$(tail -n 1 /run/secrets/DB_USER | tr -d '\n')

echo "Waiting 5 seconds for MariaDB to start..."
sleep 5

echo "INIT - Add Users / databases "

mariadb <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
    CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_PASS}';
    GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

kill $MARIADB_PID
wait $MARIADB_PID

exec mariadbd
