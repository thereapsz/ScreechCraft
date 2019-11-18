#FROM adoptopenjdk/openjdk8-openj9:alpine-nightly
FROM openjdk:8-jre-alpine
#FROM java:8

LABEL maintainer "itzg"

RUN apk add --no-cache -U \
  openssl \
  imagemagick \
  lsof \
  su-exec \
  shadow \
  bash \
  curl iputils wget \
  git \
  jq \
  mysql-client \
  tzdata \
  rsync \
  nano \
  python python-dev py2-pip

RUN addgroup -g 1000 minecraft \
  && adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft \
  && mkdir -m 777 /data /mods /config /plugins \
  && chown minecraft:minecraft /data /config /mods /plugins /home/minecraft

EXPOSE 25565 25575

COPY . /data
RUN chmod +x /usr/bin/*

VOLUME ["/data"]

WORKDIR /data

ENTRYPOINT /start.sh

COPY start* /
RUN dos2unix /start* && chmod +x /start*
