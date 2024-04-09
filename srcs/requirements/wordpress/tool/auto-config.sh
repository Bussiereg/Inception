#!/bin/bash

sleep 20

cd var/

wp config create --allow-root \
                --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
                --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306 \
                --path='/var/www/wordpress'

echo "wp core install......."
wp core install --allow-root \
            --url=$DOMAIN_NAME \
            --title=$WP_TITLE \
            --admin_user=$WP_ADMIN_USER \
            --admin_password=$WP_ADMIN_PASSWORD \
            --admin_email=$WP_ADMIN_EMAIL \
            --skip-email \
            --path='/var/www/wordpress'

echo "wp user create........"
wp user create --allow-root \
            $WP_USER2 $WP_USER2_MAIL --user_pass=$WP_USER2_PASSWORD \
            --path='/var/www/wordpress'

directory="/run/php"

if [ ! -d "$directory" ]; then
    mkdir -p $directory
    echo "Directory $directory created successfully."
else
    echo "Directory $directory already exists."
fi

echo "launch php..."

/usr/sbin/php-fpm7.4 -F
