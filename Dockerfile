# Use official PHP image with Apache
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Install required PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite (Twig often needs pretty URLs)
RUN a2enmod rewrite

# Copy project files into container
COPY . /var/www/html

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Install Twig via Composer
RUN composer install

# Expose port 10000 (Render uses 10000 for free services)
EXPOSE 10000

# Start Apache in foreground
CMD ["apache2-foreground"]
