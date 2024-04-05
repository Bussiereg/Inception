#!/bin/bash

set -a
source .env
set +a

service mariadb  start;
echo "----test1----"
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
echo "----test2----"
mariadb -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "----test3----"
mariadb -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
echo "----test4----"
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
echo "----test5----"
mariadb -e "FLUSH PRIVILEGES;"
echo "----test6----"
mysqladmin -u root -p$MYSQL_ROOT_PASSWORD shutdown
echo "----test7----"
exec mariadbd-safe