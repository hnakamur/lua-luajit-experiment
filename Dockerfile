FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y git build-essential make cmake libreadline-dev libssl-dev

COPY . /app

WORKDIR /app

RUN make

CMD sh -c "make bench3; make hmacbench3"
