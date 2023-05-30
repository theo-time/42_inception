FROM debian:buster

# Env variables
ARG DB_NAME
ARG DB_USER
ARG DB_PASSWORD
ARG DB_ROOT_PASSWORD

# Installation
RUN apt-get update -y
RUN apt-get install -y mariadb-server

# # Configuration
COPY mariadb.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf
COPY mariadb.cnf	/etc/my.cnf
COPY create_db3.sh	/tmp/create_db3.sh
COPY wordpress.sql	/tmp/wordpress.sql



# Change mysql root password
RUN service mysql start && mysqladmin -u root password ${DB_ROOT_PASSWORD}
# RUN service mysql start && mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING '${DB_ROOT_PASSWORD}'; FlUSH PRIVILEGES"
# RUN sh /tmp/create_db3.sh

#&& mysqladmin -u $ROOT -p$DB_ROOT_PASSWORD shutdown
# RUN mysqladmin -u $ROOT -p$DB_ROOT_PASSWORD shutdown
# RUN service mysql start
# RUN echo ${DB_ROOT_PASSWORD} && sleep 10
RUN service mysql start && mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}"
RUN service mysql start && mysql -u root -p${DB_ROOT_PASSWORD} -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'localhost' IDENTIFIED BY '${DB_PASSWORD}';" 
RUN service mysql start && mysql -u root -p${DB_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';" 
RUN echo "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
RUN service mysql start && mysql -u root -p${DB_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';"
RUN service mysql start && mysql -u root -p${DB_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"  
# RUN service mysql start && mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
# RUN mysql -u root -p $DB_ROOT_PASSWORD  < /tmp/wordpress.sql
# RUN mysqld_safe --skip-grant-tables --skip-networking  &
# RUN mysqld_safe --skip-grant-tables &
# RUN sh /tmp/create_db2.sh

# Ports
EXPOSE 3306

# ENTRYPOINT ["sh", "/tmp/create_db3.sh"]
ENTRYPOINT ["mysqld_safe"]

 


