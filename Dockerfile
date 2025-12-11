FROM php:8.3-apache

# Copy application files to Apache document root
COPY . /var/www/html/

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Install dependencies if composer.json exists
RUN if [ -f composer.json ]; then composer install --no-dev --optimize-autoloader; fi

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
