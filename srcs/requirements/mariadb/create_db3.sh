
echo "db name : $DB_NAME"

# Set root password
service mysql start && mysqladmin -u root password ${DB_ROOT_PASSWORD}
# service mysql start && sleep 10 && mysql -e \
#     "ALTER USER 'root'@'localhost' IDENTIFIED VIA mysql_native_password USING '$DB_ROOT_PASSWORD'; FlUSH PRIVILEGES"

# Create DB
mysql -u root -p$DB_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"