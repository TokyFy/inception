#!/bin/sh
set -e

mariadbd &
MARIADB_PID=$!

echo "Waiting 5 seconds for MariaDB to start..."
sleep 5

echo "INIT - Add Users / databases "

mariadb <<-EOSQL
    CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
    CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '$(cat /run/secrets/DB_PASSWORD | tr -d '\n')';
    GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%';
    FLUSH PRIVILEGES;
EOSQL

kill $MARIADB_PID
wait $MARIADB_PID

exec mariadbd
