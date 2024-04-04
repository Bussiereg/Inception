#!/bin/bash

set -a
source .env
set +a

sleep 10

wp config create --allow-root \
            --dbname=$MYSQL_DATABASE \
            --dbuser=$MYSQL_USER \
            --dbpass=$MYSQL_PASSWORD \
            --dbhost=mariadb:3306 --path='/var/www/wordpress'


wp core install --allow-root \ 
            --url=$DOMAIN_NAME \
            --title=$WP_TITLE \
            --admin_user=$WP_ADMIN_USER \
            --admin_password=$WP_ADMIN_PASSWORD \
            --admin_email=$WP_ADMIN_EMAIL \
            --skip-email

wp user create --allow-root \ 
            --user-login=$WP_USER2 \
            --user_pass=$WP_USER2_PASSWORD \
