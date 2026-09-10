FROM alpine:3.21

RUN apk update && apk add --no-cache nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log                         &&  \
    ln -sf /dev/stderr /var/log/nginx/error.log

#RUN chmod 755 -R /www/

COPY nginx.conf /etc/nginx/

CMD ["nginx", "-g", "daemon off;"]

