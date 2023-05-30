# Launch myMARIADB service
mysqld_safe --skip-grant-tables &
# service mysql start;

sleep 5

# Create database
echo "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" 
mysql -e -u root -p$DB_ROOT_PASSWORD "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;" 

# Manage users
echo "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "CREATE USER IF NOT EXISTS \`${DB_USER}\`@'localhost' IDENTIFIED BY '${DB_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';FLUSH PRIVILEGES;"
mysql -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO \`${DB_USER}\`@'%' IDENTIFIED BY '${DB_PASSWORD}';"


echo "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING '${DB_ROOT_PASSWORD}';"
# mysql -e "ALTER USER root@localhost IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';FLUSH PRIVILEGES;"
# mysql -e   "ALTER USER 'root'@'%' IDENTIFIED VIA mysql_native_password USING '${MARIADB_ROOT_PASSWORD}';"


# echo "flush privileges"
# mysql -e "FLUSH PRIVILEGES;"

# Restart myMARIADB
echo "shutdown mysql"
mysqladmin -u$ROOT -p$DB_ROOT_PASSWORD shutdown
# exec mysqld_safe 

# sleep 1000