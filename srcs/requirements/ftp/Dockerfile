FROM alpine:3.21

RUN apk update && \
    apk add --no-cache proftpd shadow

RUN adduser -D -h /home/franaivo franaivo && \
    mkdir /home/franaivo/www && \
    mkdir -p /var/run/proftpd && \
    chown -R franaivo:franaivo /var/run/proftpd && \
    chown -R franaivo:franaivo /home/franaivo/www

COPY proftpd.conf ftp.sh /etc/proftpd/

CMD ["/etc/proftpd/ftp.sh"]
