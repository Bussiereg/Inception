FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install vim -y
RUN apt install procps -y
RUN apt-get -y install wget

RUN apt-get -y install php7.3 php-fpm php-mysql mariadb-client

RUN wget https://wordpress.org/wordpress-6.4.3.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.4.3.tar.gz && rm wordpress-6.4.3.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./tool/php.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tool/auto-config.sh .
COPY .env .env

ENTRYPOINT [ "bash", "auto-config.sh" ]