FROM ubuntu:22.04

ENV APP red-22dec23-6cb7d502b

WORKDIR /workspace

RUN apt update

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get install -y libc6:i386 libcurl4:i386 \
        libgtk-3-0:i386 libgdk-pixbuf2.0-0:i386

RUN apt update

RUN apt install -y wget

RUN wget https://static.red-lang.org/dl/auto/linux/$APP

RUN chmod +x $APP

RUN ln -s /workspace/$APP /usr/bin/red

WORKDIR /code

COPY bin .

CMD red hello.red