# Launch mysql service
service mysql start;

export SQL_DATABASE="test_db"
export SQL_USER="teliet"
export SQL_PASSWORD="1234"
export SQL_ROOT_PASSWORD="1234"

# Create database
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Manage users
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

# Restart mysql
mysqladmin -u root -p $SQL_ROOT_PASSWORD shutdown
exec mysqld_safe