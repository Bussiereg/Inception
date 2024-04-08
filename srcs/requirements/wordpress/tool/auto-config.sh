#!/bin/bash

# set -a
# source .env
# set +a

sleep 10

wp config create --allow-root --path='/var/www/wordpress' \
                --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER \
                --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306

echo "wp core install......."
wp core install --allow-root --path='/var/www/wordpress'\
            --url=$DOMAIN_NAME \
            --title=$WP_TITLE \
            --admin_user=$WP_ADMIN_USER \
            --admin_password=$WP_ADMIN_PASSWORD \
            --admin_email=$WP_ADMIN_EMAIL \
            --skip-email

echo "wp user create........"
wp user create --allow-root --path='/var/www/wordpress' \
            --user-login=$WP_USER2 \
            --user_pass=$WP_USER2_PASSWORD \
    

directory="/run/php"

# Check if the directory exists


if [ ! -d "$directory" ]; then
    # Create the directory
    mkdir -p $directory
    echo "Directory $directory created successfully."
else
    echo "Directory $directory already exists."
fi

/usr/sbin/php-fpm7.4 -F

# service php7.4-fpm start


# wp config create --allow-root --path='/var/www/wordpress' --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb:3306


# wp core install --allow-root --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email
