FROM debian:bullseye-slim

RUN apt update && apt install -y cowsay lolcat python3 python3-pip 

RUN pip install flask

COPY tux.sh tux.py /etc/

CMD ["/etc/tux.sh"]
