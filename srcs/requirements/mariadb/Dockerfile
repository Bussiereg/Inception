FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/script.sh /

ENTRYPOINT ["bash", "/script.sh"]