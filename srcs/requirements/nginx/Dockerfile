FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx -y
RUN mkdir -p /etc/nginx/ssl && mkdir -p /var/run/nginx
RUN apt install openssl -y

RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Berlin/L=Berlin/O=42/OU=42/CN=gbussier/UID=gbussier/"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]