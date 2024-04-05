FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN apt install vim -y
RUN apt install procps -y
RUN apt-get install mariadb-server -y

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tool/script.sh /
COPY .env .env

CMD ["bash", "/script.sh"]