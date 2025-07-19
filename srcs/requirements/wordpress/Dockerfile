FROM alpine:3.22

RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    git

COPY www.conf /etc/php83/php-fpm.d/

RUN git clone --depth 1 https://github.com/WordPress/WordPress.git /www/

EXPOSE 9000

CMD ["php-fpm83" , "-F" , "-R"]
