# Use official PHP image with Apache
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Copy project files into container (including vendor/)
COPY . /var/www/html

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install required PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Expose port Render expects
EXPOSE 10000

# Start Apache
CMD ["apache2-foreground"]
