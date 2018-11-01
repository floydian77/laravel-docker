FROM php:7.2-fpm

RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    zlib1g-dev \
    mysql-client \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    gnupg \
    unzip \
    --no-install-recommends

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
    && apt-get install -y nodejs

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install -j$(nproc) zip iconv gd pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN mkdir /.composer && chown ${DOCKER_USER_UID}:${DOCKER_USER_GID} /.composer \
    && mkdir /.npm && chown ${DOCKER_USER_UID}:${DOCKER_USER_GID} /.npm \
    && mkdir /.config && chown ${DOCKER_USER_UID}:${DOCKER_USER_GID} /.config

COPY ssl/server.crt /usr/local/share/ca-certificates/
RUN update-ca-certificates --fresh