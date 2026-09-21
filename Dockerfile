FROM php:8.2-apache

# Ensure only mpm_prefork is loaded (fixes AH00534: More than one MPM loaded)
RUN rm -f /etc/apache2/mods-enabled/mpm_*.load /etc/apache2/mods-enabled/mpm_*.conf \
    && a2enmod mpm_prefork rewrite

# Install PDO MySQL extension
RUN docker-php-ext-install pdo pdo_mysql

# Enable .htaccess overrides
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Allow VirtualHost to respond on any listening port
RUN sed -i 's/<VirtualHost \*:80>/<VirtualHost *:*>/' /etc/apache2/sites-available/000-default.conf

COPY . /var/www/html/

# Listen on Railway's dynamic PORT (defaults to 8080)
CMD sh -c "echo \"Listen \${PORT:-8080}\" > /etc/apache2/ports.conf && exec apache2-foreground"
