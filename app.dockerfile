FROM php:7.2-fpm

COPY ssl/nginx.crt /usr/local/share/ca-certificates/

RUN apt-get update && apt-get install -y libmcrypt-dev zlib1g-dev mysql-client libpng-dev gnupg unzip \
    --no-install-recommends \
    && update-ca-certificates --fresh \
    && curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs \
    && docker-php-ext-install zip \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_mysql \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir /.composer && chown 1000:1000 /.composer \
    && mkdir /.npm && chown 1000:1000 /.npm \
    && mkdir /.config && chown 1000:1000 /.config
