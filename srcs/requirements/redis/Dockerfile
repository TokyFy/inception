FROM alpine:3.21

RUN apk update && \
    apk add --no-cache redis

COPY redis.conf /etc/redis.conf

EXPOSE 6379

COPY redis.sh /etc/

CMD ["/etc/redis.sh"]
