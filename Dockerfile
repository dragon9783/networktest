FROM alpine
MAINTAINER Jeddy Liu <dragon9783@126.com>

ADD ./networktest.sh /networktest.sh
CMD /networktest.sh
