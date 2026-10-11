FROM alpine:3.21

RUN apk update && \
    apk add --no-cache ruby ruby-dev git zlib-dev xz-dev build-base 

RUN gem install sinatra rackup puma && \
    mkdir /www && \
    git clone  https://github.com/TokyFy/mee.git /www/

COPY meine.sh /www/

WORKDIR /www

CMD ["/www/meine.sh"]
    
