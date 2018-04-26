FROM php:7.2-fpm-alpine

RUN apk upgrade --update && apk add --no-cache libjpeg-turbo \
libjpeg-turbo-dev \
libpng \
libpng-dev \
freetype \
freetype-dev

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so php

RUN docker-php-ext-install pdo_mysql && docker-php-ext-install zip && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-png-dir=/usr/include --with-jpeg-dir=/usr/include && docker-php-ext-install gd

RUN mkdir /usr/share/nginx && mkdir /usr/share/nginx/html

RUN apk del --no-cache freetype-dev \
m4 \
perl \
autoconf \
libmagic \
file \
libgcc \
libstdc++ \
binutils-libs \
binutils \
gmp \
isl \
libgomp \
libatomic \
mpfr3 \
mpc1 \
gcc \
musl-dev \
libc-dev \
g++ \
make \
re2c
