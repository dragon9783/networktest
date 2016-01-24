FROM debian
MAINTAINER Jeddy Liu <dragon9783@126.com>

RUN mkdir -p /var/log/networktest

ADD ./networktest.sh /networktest.sh


CMD /networktest.sh
