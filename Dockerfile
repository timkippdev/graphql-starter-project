FROM php:7.1-apache

WORKDIR /var/www

RUN apt-get update && \
    apt-get install -y git zip unzip && \
    pecl install xdebug && \
    echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini && \
    apt-get -y autoremove && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    a2enmod rewrite

# copy Apache conf
COPY ./.docker/apache.conf /etc/apache2/sites-available/000-default.conf

# install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin/ --filename=composer

COPY . .