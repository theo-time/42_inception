FROM debian:buster

# Install required packages 
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y \
    php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client \
    wget

# Download and install wordpress
RUN wget https://fr.wordpress.org/wordpress-6.2.1-fr_FR.tar.gz -P /var/www/html
WORKDIR /var/www/html
RUN tar -xzf wordpress-6.2.1-fr_FR.tar.gz && rm wordpress-6.2.1-fr_FR.tar.gz 
RUN	chown -R root:root wordpress

# Download and install Wordpress CLI 
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./auto_config.sh /tmp/auto_config.sh

CMD ["sh", "/tmp/auto_config.sh"]