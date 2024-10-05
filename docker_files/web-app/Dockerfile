FROM amd64/php:8.2-apache-bookworm 

ARG PIWIGO_VERSION=latest

RUN apt update

# Install prerequisites
RUN apt-get install -y wget unzip imagemagick

RUN docker-php-ext-install mysqli

# Get the latest Piwigo code
RUN wget -O /tmp/piwigo.zip https://piwigo.org/download/dlcounter.php?code=${PIWIGO_VERSION} 

# Extract the Piwigo code
RUN unzip /tmp/piwigo.zip -d /tmp

# Move application code to webserver directory
RUN mv /tmp/piwigo/* /var/www/html

# Set user and group permission on files
RUN chown -R www-data:www-data /var/www/html

# Set configuration params of the application
RUN sed -i 's/;extension=mysqli/extension=mysqli/g' /usr/local/etc/php/php.ini-*

VOLUME /var/www/html/upload /var/www/html/_data /var/www/html/local/config

WORKDIR /var/www/html

CMD ["apache2-foreground"]
