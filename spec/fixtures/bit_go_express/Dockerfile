FROM node:6

ENV BITGO_VERSION=4.35.0

WORKDIR /app

RUN apt-get update -yqq && apt-get upgrade -yqq && \
  apt-get install unzip wget -y && \
  wget https://github.com/BitGo/BitGoJS/archive/$BITGO_VERSION.zip && \
  unzip $BITGO_VERSION.zip && \
  mv BitGoJS-$BITGO_VERSION/* /app && \
  npm install
