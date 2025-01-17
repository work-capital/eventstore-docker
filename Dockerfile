FROM ubuntu:14.04.3
MAINTAINER Event Store LLP <ops@geteventstore.com>

ENV ES_VERSION=3.8.0

RUN apt-get update && apt-get install curl -y &&\
    curl -s https://packagecloud.io/install/repositories/EventStore/EventStore-OSS/script.deb.sh | bash &&\
    apt-get install eventstore-oss=$ES_VERSION -y &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 1113
EXPOSE 2113

VOLUME /var/lib/eventstore

COPY eventstore.conf /etc/eventstore/
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
