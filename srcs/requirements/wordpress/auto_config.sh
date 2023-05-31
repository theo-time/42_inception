
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

    wp core install --allow-root \
                    --url=$DOMAIN_NAME/ \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN_USR \
                    --admin_password=$WP_ADMIN_PWD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --skip-email \
                    --path='/var/www/html/wordpress'
else 
    echo "wp-config already exists"
fi

echo "define( 'WP_REDIS_HOST', 'redis' );" >> /var/www/wordpress/wp-config.php
echo "define( 'WP_REDIS_PORT', 6379 );" >> /var/www/wordpress/wp-config.php
echo "define('WP_CACHE', true);" >> /var/www/wordpress/wp-config.php

# Config and launch php 
mkdir /run/php
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf
/usr/sbin/php-fpm7.3 -F
