FROM ubuntu:19.10

RUN apt-get update
RUN apt-get install -y lua5.1 luarocks

RUN luarocks install busted

WORKDIR /app