#!/bin/bash

# set -a
# source .env
# set +a

service mariadb  start;
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
sleep 1
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
# echo "test2"
sleep 2
mariadb -e "FLUSH PRIVILEGES;"
sleep 1
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
exec mariadbd-safe