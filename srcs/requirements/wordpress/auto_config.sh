sleep 10

export SQL_DATABASE="test_db"
export SQL_USER="mysql"
export SQL_PASSWORD="12345789"

wp config create	--allow-root \
                    --dbname=$SQL_DATABASE \
                    --dbuser=$SQL_USER \
                    --dbpass=$SQL_PASSWORD \
                    --dbhost=mariadb:3306 \
                    --path='/var/www/wordpress'
