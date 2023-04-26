FROM php:8.2-fpm-alpine3.16

# Install PHP extensions and enable them
RUN docker-php-ext-install mysqli pdo pdo_mysql && \
    docker-php-ext-enable pdo_mysql

# Install dependencies and clean up after installation
RUN apk --no-cache --virtual .build-deps add \
        php8-dev \
        autoconf \
        gcc \
        g++ \
        make \
    && apk --no-cache add \
        php8-tokenizer \
        php8-session \
        php8-json \
        php8-mbstring \
        php8-pdo_mysql \
        php8-xmlreader \
        php8-zlib \
        supervisor \
    && pecl install -o -f redis \
    && docker-php-ext-enable redis \
    && apk del .build-deps \
    && rm -rf /tmp/* /var/cache/apk/* /var/tmp/* /usr/share/man /usr/share/doc