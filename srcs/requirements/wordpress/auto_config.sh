
echo "Wordpress tries to connect to $DB_NAME as $DB_USER with password $DB_PASSWORD" 

# if !( wp core is-installed --alow-root & [ -f "$(wp config path --allow-root)" ]); then
wp config create	--allow-root \
                    --dbname=$DB_NAME \
                    --dbuser=$DB_USER \
                    --dbpass=$DB_PASSWORD \
                    --dbhost=mariadb:3306 \
                    --path='/var/www/wordpress'
