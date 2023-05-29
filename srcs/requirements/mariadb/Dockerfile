FROM debian:buster

# Installation
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y mariadb-server

# # Configuration
COPY mariadb.conf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY mariadb.conf	/etc/my.cnf
COPY create_db.sh	/tmp/create_db.sh

# # Ports
EXPOSE 3306

# RUN mysqld_safe --skip-grant-tables --skip-networking  &
# RUN mysqld_safe --skip-grant-tables &
RUN sh /tmp/create_db.sh

# ENTRYPOINT ["sh", "/tmp/create_db.sh"]
ENTRYPOINT ["mysqld_safe"]

 


