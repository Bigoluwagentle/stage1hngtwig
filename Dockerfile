# Use official PHP image with Apache
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Copy project files (do NOT copy local vendor)
COPY . /var/www/html

# Enable Apache mod_rewrite
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Install Composer inside container
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Run composer install inside container to get all dependencies fresh
RUN composer install --no-dev --optimize-autoloader

# Expose port for Render
EXPOSE 10000

# Start Apache
CMD ["apache2-foreground"]
