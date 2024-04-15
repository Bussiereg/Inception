FROM debian:bullseye

RUN apt update -y && apt upgrade -y
RUN apt-get -y install wget
# RUN apt -y install systemd
RUN apt-get -y install php7.4 php-fpm php-mysql
RUN apt-get -y install mariadb-client

COPY ./tool/php.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN wget https://wordpress.org/latest.zip -P /var/www

RUN apt-get install -y unzip && cd /var/www && unzip latest.zip && rm latest.zip

RUN	chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tool/auto-config.sh .

ENTRYPOINT [ "bash", "auto-config.sh" ]