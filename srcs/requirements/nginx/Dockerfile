FROM alpine:3.22

RUN apk update && apk add --no-cache nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log                         &&  \
    ln -sf /dev/stderr /var/log/nginx/error.log

COPY nginx.conf /etc/nginx/

CMD ["nginx", "-g", "daemon off;"]

