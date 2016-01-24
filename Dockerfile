FROM debian
MAINTAINER Jeddy Liu <dragon9783@126.com>

RUN apt-get update && apt-get install netcat -y && rm -fr /var/lib/apt/*
RUN mkdir -p /var/log/networktest

ADD ./networktest.sh /networktest.sh


CMD /networktest.sh
