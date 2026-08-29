FROM alpine:3.21

RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    git \
    curl \
    php-phar \
    php-mbstring \
    php-iconv \
    php83-gd \
    php83-curl \
    php83-json \
    php83-xml \
    php83-zip \
    php83-opcache \
    php83-exif \
    php83-ctype \
    php83-session \
    php83-dom \
    php83-pecl-redis

COPY www.conf /etc/php83/php-fpm.d/
COPY php.ini /etc/php83
 
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    &&  chmod +x wp-cli.phar \
    &&  mv wp-cli.phar /usr/local/bin/wp

RUN git clone --depth 1 https://github.com/TokyFy/wp.git /www

RUN adduser -S -G www-data www-data

COPY wp.init.sh /run/

ENTRYPOINT ["/run/wp.init.sh"]
