FROM alpine:3.22

RUN apk update && \
    apk add --no-cache mariadb mariadb-client

RUN addgroup -S maria && adduser -S maria -G maria

RUN mkdir -p /var/lib/mysql \
    && mkdir -p /run/mysqld \
    && chown -R maria:maria /run/mysqld \
    && chown -R maria:maria /var/lib/mysql \
    && mariadb-install-db --user=maria --basedir=/usr --datadir=/var/lib/mysql

COPY my.cnf /etc/

EXPOSE 3306

COPY init.sh /run/mysqld/

USER maria

CMD ["/run/mysqld/init.sh"]

