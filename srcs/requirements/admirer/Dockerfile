FROM alpine:3.21

RUN apk update && apk add --no-cache \
    php83 \
    php83-mysqli \
    php83-pdo_mysql \
    php83-pgsql \
    php83-session \
    wget

RUN mkdir -p admirer && \
    wget https://github.com/vrana/adminer/releases/download/v5.3.0/adminer-5.3.0.php \
    -O /admirer/admirer.php && \
    wget https://www.adminer.org/download/v5.3.0/designs/hever/adminer.css \
    -P /admirer/

WORKDIR /admirer

CMD ["php83", "-S", "0.0.0.0:8080" , "admirer.php"]
