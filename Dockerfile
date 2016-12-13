FROM php:7.1-fpm-alpine

RUN apk upgrade --update && apk add --no-cache libjpeg-turbo libjpeg-turbo-dev libpng libpng-dev freetype freetype-dev
RUN docker-php-ext-install pdo_mysql && docker-php-ext-install zip && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-png-dir=/usr/include --with-jpeg-dir=/usr/include && docker-php-ext-install gd

RUN mkdir /usr/share/nginx && mkdir /usr/share/nginx/html

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php && php -r "unlink('composer-setup.php');" && php -r "ini_set('max_execution_time', 0);"
RUN mv composer.phar /usr/local/bin/composer
RUN apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev m4 perl autoconf libmagic file libgcc libstdc++ binutils-libs binutils gmp isl libgomp libatomic mpfr3 mpc1 gcc musl-dev libc-dev g++ make re2c
RUN cd /usr/share/nginx/html && composer create-project web-feet/coastercms .
RUN php -r "ini_set('max_execution_time', 30);"
