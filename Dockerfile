FROM php:7.3.31-apache-buster

ENV VERSION 2.02_LDAP

RUN apt-get update && apt-get install -y libzip-dev libfreetype6-dev libldap2-dev\
  && docker-php-ext-install mysqli \
  && docker-php-ext-install gd \
  && docker-php-ext-install zip \
  && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
  && docker-php-ext-install ldap \
  && apt autoremove && apt autoclean && apt remove && apt clean

COPY . /var/www/html/

RUN rm -rf /var/www/html/*.md && rm -rf /var/www/html/Dockerfile

RUN chown -R www-data:www-data /var/www/html/