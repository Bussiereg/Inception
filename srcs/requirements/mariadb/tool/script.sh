#!/bin/bash

set -a
source .env
set +a

service mariadb  start;
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
sleep 2
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
sleep 2
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"

# mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
sleep 2
mariadb -e "FLUSH PRIVILEGES;"
sleep 2
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
sleep 2
exec mariadbd-safe