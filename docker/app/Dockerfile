FROM php:fpm

RUN apt-get update \
    && apt-get install -y zlib1g-dev vim \
    && docker-php-ext-install zip pdo_mysql mbstring

RUN pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis

RUN pecl install -o -f xdebug \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable xdebug

#RUN apt-get install -y curl apt-transport-https ca-certificates \
#    && apt-get install -y gnupg2 \
#    && curl --fail -ssL -o setup-nodejs https://deb.nodesource.com/setup_8.x \
#    && bash setup-nodejs \
#    && apt-get install -y nodejs build-essential

# 設定ファイルの設置
COPY docker/app/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /composer
ENV PATH $PATH:/composer/vendor/bin

RUN composer global require "hirak/prestissimo" \
    && composer global require "laravel/installer"

VOLUME ["/var/www"]
WORKDIR /var/www/drafan

EXPOSE 9000
CMD ["php-fpm"]