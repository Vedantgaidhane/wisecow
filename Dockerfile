FROM ubuntu:latest

RUN apt-get update -y && apt-get install git cowsay fortune netcat-openbsd -y

RUN . /root/.bashrc

ENV PATH="$PATH:/usr/games"

COPY wisecow.sh /app/wisecow.sh

WORKDIR /app

EXPOSE 4499

CMD ["./wisecow.sh"]
