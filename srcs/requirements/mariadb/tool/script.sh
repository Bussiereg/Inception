#!/bin/bash

service mariadb  start;
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
sleep 1
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
sleep 1
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
sleep 1
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
sleep 1
mariadb -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
sleep 1
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
sleep 1
exec mariadbd-safe