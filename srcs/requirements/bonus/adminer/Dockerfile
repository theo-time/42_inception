FROM debian:buster

RUN  apt-get update -y
RUN  apt install wget -y && apt-get install php php-mysql -y

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php 
RUN chown -R www-data:www-data /var/www/html/adminer.php && chmod 755 /var/www/html/adminer.php

COPY ./conf/launch.sh ./

CMD ["sh", "./launch.sh"]
