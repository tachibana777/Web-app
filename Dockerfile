FROM php:8.2-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install PDO MySQL extension
RUN docker-php-ext-install pdo pdo_mysql

# Allow .htaccess Overrides
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Copy application files
COPY . /var/www/html/

# Copy and set permissions for entrypoint
RUN chmod +x /var/www/html/entrypoint.sh
RUN chown -R www-data:www-data /var/www/html

CMD ["/bin/sh", "/var/www/html/entrypoint.sh"]
