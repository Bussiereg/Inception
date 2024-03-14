FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install vim -y
RUN apt-get install mariadb-server

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf



# EXPOSE port

# ENTRYPOINT [ "executable" ]