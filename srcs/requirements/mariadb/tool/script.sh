#!/bin/bash

echo "start mariadb"
service mariadb start;
sleep 1
echo "create database"
mariadb -u root -p${MYSQL_ROOT_PASSWORD}  -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
sleep 2
echo "create user"
mariadb -u root -p${MYSQL_ROOT_PASSWORD}  -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "grant privileges"
mariadb -u root -p${MYSQL_ROOT_PASSWORD}  -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "add password for root"
mariadb -u root -p${MYSQL_ROOT_PASSWORD}  -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
sleep 2
echo "reset privileges"
mariadb -u root -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
sleep 2
echo "restart mysql"
mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown
sleep 2
echo "exec mariadb"
exec mariadbd-safe