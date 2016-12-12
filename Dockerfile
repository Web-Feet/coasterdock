FROM php:7-fpm

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install libjpeg-dev -y
RUN apt-get install libpng-dev -y
RUN apt-get install libfreetype6-dev -y
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install zip
RUN docker-php-ext-configure gd --enable-gd-native-ttf --with-jpeg-dir=/usr/local --with-png-dir=/usr/local --with-freetype-dir=/usr/local
RUN docker-php-ext-install gd
RUN apt-get autoremove -y
RUN apt-get clean

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
