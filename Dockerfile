FROM php:7.0.10-fpm-alpine

RUN apk add --no-cache bash mysql-client curl libtool build-base autoconf && \
    docker-php-ext-install \
      -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
      iconv gd mbstring fileinfo curl xmlreader xmlwriter spl ftp mysqli opcache && \
    apk del libtool build-base autoconf
