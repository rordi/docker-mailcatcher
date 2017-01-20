FROM alpine:latest

MAINTAINER Dietrich Rordorf <dr@ediqo.com>

USER root

# exit on error
RUN set -e

# install ruby dependencies
RUN apk add --no-cache ruby ruby-bigdecimal ruby-json libstdc++ sqlite-libs

# install mailcatcher
RUN apk add --no-cache --virtual .build-deps ruby-dev make g++ sqlite-dev
RUN gem install mailcatcher --no-ri --no-rdoc

# expose ports
EXPOSE 1025
EXPOSE 1080

# remove no longer needed packages
RUN apk del .build-deps
RUN rm -rf /tmp/* /var/tmp/*

# run process
CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
