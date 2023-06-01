FROM debian:buster

# Env variables
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

# Installation
RUN apt-get update -y 
RUN apt-get install -y mariadb-server mariadb-client

# Configuration
COPY mariadb.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Create database and user for wordpress
RUN service mysql start && mysqladmin -u root password ${DB_ROOT_PASSWORD}
RUN service mysql start && mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}"
RUN service mysql start && mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" 
RUN service mysql start && mysql -u root -p${DB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';FLUSH PRIVILEGES;"
RUN service mysql start && mysql -u root -p${DB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"  

# ENTRYPOINT ["sh", "/tmp/create_db3.sh"]
CMD ["mysqld"]

 


