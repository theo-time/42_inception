# Launch myMARIADB service
service mysql start;
# mysqld_safe --skip-grant-tables --skip-networking  &

export MARIADB_DATABASE="test_db"
export MARIADB_USER="mysql"
export MARIADB_PASSWORD="1234"
export MARIADB_ROOT_PASSWORD="1234"

# Create database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;" 

# Manage users
mysql -e "CREATE USER IF NOT EXISTS \`${MARIADB_USER}\`@'localhost' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO \`${MARIADB_USER}\`@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "ALTER USER root@localhost IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

# Restart myMARIADB
mysqladmin -u root -p $MARIADB_ROOT_PASSWORD shutdown
exec mysqld_safe --user=mysql --console