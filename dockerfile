#FROM adoptopenjdk/openjdk8-openj9:alpine-nightly
FROM openjdk:8-jre-alpine

LABEL maintainer "TheReapsZ"

RUN addgroup -g 1000 minecraft \
  && adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft \
  && mkdir -m 777 /data /mods /config /plugins \
  && chown minecraft:minecraft /data /config /mods /plugins /home/minecraft

EXPOSE 25565

VOLUME ["/data","/mods","/config"]
WORKDIR /data

ARG VERSION=v1.0
#ADD https://github.com/thereapsz/ScreechCraft/releases/tag/${VERSION} /data
COPY . /data
#COPY start.sh /data

RUN chmod +x /data
RUN chmod a+x /data/start.sh

ENTRYPOINT ["/data/start.sh"]

#CMD ./start.sh
