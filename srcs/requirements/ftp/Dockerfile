FROM alpine:3.21

RUN apk update && \
    apk add --no-cache vsftpd shadow

RUN adduser -D -h /home/franaivo franaivo && \
    mkdir /home/franaivo/www && \
    chown -R franaivo:franaivo /home/franaivo/www

COPY vsftpd.conf ftp.sh /etc/vsftpd/

CMD ["/etc/vsftpd/ftp.sh"]
