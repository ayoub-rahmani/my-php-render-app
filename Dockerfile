FROM php:8.3-apache

# Copy app files
COPY . /var/www/html/

# Render requires port 10000 (not 80)
RUN sed -i 's/80/10000/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

EXPOSE 10000

CMD ["apache2-foreground"]
