
echo "Wordpress tries to connect to $DB_NAME as $DB_USER with password $DB_PASSWORD" 
# sleep 10


# Configure Wordpress website
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root \
                        --dbname="$DB_NAME" \
                        --dbuser="$DB_USER" \
                        --dbpass="$DB_PASSWORD" \
                        --dbhost=mariadb:3306 \
                        --path='/var/www/html/wordpress'
else 
    echo "wp-config already exists"
fi

# Launch php 
mkdir /run/php
/usr/sbin/php-fpm7.3 -F

while [ 1 ]
do
    foo
    sleep 2
done
