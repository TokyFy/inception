FROM alpine:3.21

RUN apk add --no-cache cgit fcgiwrap spawn-fcgi git

RUN mkdir -p /git && chown -R nobody:nogroup /git

COPY cgitrc /etc/cgitrc

WORKDIR /git

RUN git clone https://github.com/TokyFy/wp.git && \
    git clone https://github.com/TokyFy/mee.git


CMD ["spawn-fcgi" , "-p" , "9000" , "-n" , "/usr/bin/fcgiwrap"]
