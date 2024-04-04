FROM debian:bullseye

RUN apt update
RUN apt upgrade
RUN apt install vim -y
RUN apt install procps -y
RUN apt-get -y install wget
RUN apt-get -y install php7.3 php-fpm php-mysql mariadb-client
RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz
RUN		chown -R root:root /var/www/wordpress

COPY ./tools/wpconfig.php /var/www/wordpress/

