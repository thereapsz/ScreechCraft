#FROM adoptopenjdk/openjdk8-openj9:alpine-nightly
FROM openjdk:8-jre-alpine

LABEL maintainer "thereapsz"

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

#RUN git clone --branch Server https://github.com/thereapsz/ScreechCraft.git /data
COPY . /data
RUN chmod +x /usr/bin/*

RUN dos2unix /data/start.sh
RUN chmod +x /data/start.sh

VOLUME ["/data"]
WORKDIR /data
ENTRYPOINT /data/start.sh
