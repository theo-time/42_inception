FROM debian:buster

# Install required packages 
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y nginx
RUN apt-get install -y openssl

# SSL Config
RUN mkdir /etc/nginx/ssl 
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out    /etc/nginx/ssl/cert.pem \
    -keyout /etc/nginx/ssl/key.pem \
    -subj "/C=FR/ST=IDF/L=Paris/O=42 School Paris/OU=42/CN=teliet.42.fr"

# Copy config files
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /var/www/html/

# Manage rights 
RUN chmod 755 /var/www/html 
RUN chown -R www-data:www-data /var/www/html

# Open port 443
EXPOSE 443

# Start nginx with daemon mode off
CMD ["nginx", "-g", "daemon off;"]