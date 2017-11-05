FROM alpine:latest
MAINTAINER Dietrich Rordorf <dr@ediqo.com>

# set exit on error flag, install ruby deps, build mailcatcher, remove buold deps
RUN set -e && \
    apk add --no-cache ruby ruby-bigdecimal ruby-json libstdc++ sqlite-libs && \
    apk add --no-cache --virtual .build-deps ruby-dev make g++ sqlite-dev && \
    gem install mailcatcher --no-ri --no-rdoc && \
    apk del .build-deps && \
    rm -rf /tmp/* /var/tmp/*

# expose ports
EXPOSE 1025 1080

# entrypoint: run mailcatcher process
CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
