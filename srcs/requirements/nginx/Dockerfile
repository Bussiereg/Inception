FROM debian:bullseye

RUN apt update
RUN apt upgrade
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install procps -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=Berlin/L=Berlin/O=42/OU=42/CN=gbussier.42.fr/UID=gbussier/"
RUN mkdir -p /var/run/nginx
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]