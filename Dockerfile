FROM php:8.3-apache

# Copy application files
COPY . /var/www/html/

# Change Apache to listen on port 10000 (Render requirement)
RUN sed -i 's/Listen 80/Listen 10000/g' /etc/apache2/ports.conf && \
    sed -i 's/:80/:10000/g' /etc/apache2/sites-available/000-default.conf

# Set ServerName to suppress warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 10000

CMD ["apache2-foreground"]
