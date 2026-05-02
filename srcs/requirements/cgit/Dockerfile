FROM alpine:3.21

RUN apk add --no-cache cgit fcgiwrap spawn-fcgi git python3 py3-pip && \
    pip install --break-system-packages Pygments

RUN mkdir -p /git && chown -R nobody:nogroup /git

WORKDIR /git

RUN git clone https://github.com/TokyFy/wp.git && \
    git clone https://github.com/TokyFy/mee.git && \
    git clone https://github.com/TokyFy/inception.git

COPY cgitrc /etc/cgitrc

CMD ["spawn-fcgi" , "-p" , "9000" , "-n" , "/usr/bin/fcgiwrap"]
