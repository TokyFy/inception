FROM alpine:3.22

RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    git \
    curl \
    php-phar \
    php-mbstring \
    php-iconv

COPY www.conf /etc/php83/php-fpm.d/
COPY php.ini /etc/php83

RUN git clone --depth 1 https://github.com/TokyFy/wp.git /www/

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    &&  chmod +x wp-cli.phar \
    &&  mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY wp.init.sh /run/

ENTRYPOINT ["/run/wp.init.sh"]
