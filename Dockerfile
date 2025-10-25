# Use official PHP image with Apache
FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Install required PHP extensions and utilities for Composer
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    libzip-dev \
    && docker-php-ext-install pdo pdo_mysql zip \
    && a2enmod rewrite \
    && rm -rf /var/lib/apt/lists/*

# Copy project files (do NOT copy local vendor)
COPY . /var/www/html

# Install Composer inside container
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Run composer install inside container
RUN composer install --no-dev --optimize-autoloader

# Expose port for Render
EXPOSE 10000

# Start Apache
CMD ["apache2-foreground"]
