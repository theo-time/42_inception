FROM debian:buster

# Install required packages 
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.3 \
    php-fpm \
    php-mysql \
    mariadb-client

# Download and install wordpress
RUN mkdir /var/www
RUN cd  /var/www 
RUN wget https://fr.wordpress.org/wordpress-6.2.1-fr_FR.tar.gz -P ./
RUN tar -xzf wordpress-6.2.1-fr_FR.tar.gz && rm wordpress-6.2.1-fr_FR.tar.gz 
RUN	chown -R root:root wordpress

EXPOSE 9000