FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libicu-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    libxml2-dev \
    libonig-dev \
    libxslt1-dev \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        mysqli \
        pdo \
        pdo_mysql \
        intl \
        gd \
        zip \
        soap \
        exif \
        xsl \
    && a2enmod rewrite \
    && mkdir -p /var/www/moodledata \
    && chown -R www-data:www-data /var/www/moodledata \
    && chmod -R 777 /var/www/moodledata \
    && echo "max_input_vars = 5000" > /usr/local/etc/php/conf.d/moodle.ini \
    && rm -rf /var/lib/apt/lists/*
