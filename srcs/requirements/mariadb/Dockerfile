FROM debian:buster

EXPOSE 3306

RUN apt-get update && apt-get install -y \
    mariadb-server

COPY ./50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./runme.sh /
RUN chmod +x runme.sh

CMD ["./runme.sh"]