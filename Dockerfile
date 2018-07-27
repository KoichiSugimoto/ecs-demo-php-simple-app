# Install ndinx
FROM nginx:1.13.5-alpine
RUN apk --update add openssl
RUN mkdir -p /var/www/drafan
COPY ./docker/nginx/nginx.conf /etc/nginx/nginx.conf

## Install Laravel
# FROM php:fpm

# RUN apt-get update \
#     && apt-get install -y zlib1g-dev vim \
#     && docker-php-ext-install zip pdo_mysql mbstring

# RUN pecl install -o -f redis \
#     && rm -rf /tmp/pear \
#     && docker-php-ext-enable redis

# RUN pecl install -o -f xdebug \
#     && rm -rf /tmp/pear \
#     && docker-php-ext-enable xdebug

# COPY ./docker/app/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#     && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
#     && php composer-setup.php \
#     && php -r "unlink('composer-setup.php');" \
#     && mv composer.phar /usr/local/bin/composer

# ENV COMPOSER_ALLOW_SUPERUSER 1
# ENV COMPOSER_HOME /composer
# ENV PATH $PATH:/composer/vendor/bin

# RUN composer global require "hirak/prestissimo" \
#     && composer global require "laravel/installer"

# Install docker-compose
# RUN add-apt-repository ppa:git-core/ppa -y
# RUN apt-get update -y
# RUN apt-get install -y build-essential python-pip git
# RUN pip install docker-compose

