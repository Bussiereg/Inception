#!/bin/bash

sleep 10

directory="/run/php"

# Check if the directory exists
if [ ! -d "$directory" ]; then
    # Create the directory
    sudo mkdir -p "$directory"
    echo "Directory $directory created successfully."
else
    echo "Directory $directory already exists."
fi

wp config create --allow-root \
            --dbname=$MYSQL_DATABASE \
            --dbuser=$MYSQL_USER \
            --dbpass=$MYSQL_PASSWORD \
            --dbhost=mariadb:3306 \
            --path='/var/www/wordpress/'


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
    

/usr/sbin/php-fpm7.4 -F
