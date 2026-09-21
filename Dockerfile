FROM php:8.2-apache

RUN a2enmod rewrite
RUN docker-php-ext-install pdo pdo_mysql

RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

COPY . /var/www/html/

CMD sh -c "sed -i \"s/Listen 80/Listen \${PORT:-80}/\" /etc/apache2/ports.conf && sed -i \"s/<VirtualHost \*:80>/<VirtualHost \*:\${PORT:-80}>/\" /etc/apache2/sites-available/000-default.conf && exec apache2-foreground"

