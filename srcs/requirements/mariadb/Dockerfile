FROM debian:buster

# Installation
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

# # Configuration
COPY mariadb.conf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY create_db.sh	/tmp/create_db.sh

# # Ports
EXPOSE 3306

RUN sh /tmp/create_db.sh

# ENTRYPOINT ["sh", "/tmp/create_db.sh"]
ENTRYPOINT ["exec", "mysqld_safe"]

 


