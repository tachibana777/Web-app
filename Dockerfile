FROM php:8.2-apache

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install PDO MySQL extension
RUN docker-php-ext-install pdo pdo_mysql

# Allow .htaccess Overrides
RUN sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf

# Copy application files
COPY . /var/www/html/

# Set working permissions
RUN chown -R www-data:www-data /var/www/html

# Run Apache binding to Railway dynamic $PORT
CMD sh -c "sed -i 's/Listen .*/Listen '\${PORT:-8080}'/g' /etc/apache2/ports.conf && sed -i 's/<VirtualHost .*/<VirtualHost *:'\${PORT:-8080}'>/g' /etc/apache2/sites-available/000-default.conf && apache2-foreground"
