FROM php:8.2-fpm-alpine3.16

RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable pdo_mysql

RUN apk --no-cache add \
  php8-tokenizer \
  php8-session \
  php8-json \
  php8-mbstring \
  php8-pdo_mysql \
  php8-xmlreader \
  php8-zlib \
  supervisor

# Configure supervisord
COPY php/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Configure PHP-FPM
COPY php/fpm-pool.conf /etc/php8/php-fpm.d/www.conf
COPY php/php.ini /etc/php8/conf.d/custom.ini

# composer install
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer
