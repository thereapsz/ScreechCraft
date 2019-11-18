FROM adoptopenjdk/openjdk8-openj9:alpine-nightly

LABEL maintainer "TheReapsZ"

RUN addgroup -g 1000 minecraft \
  && adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft \
  && mkdir -m 777 /data /mods /config /plugins \
  && chown minecraft:minecraft /data /config /mods /plugins /home/minecraft

EXPOSE 25565

ARG VERSION=v1.0
ADD https://github.com/thereapsz/ScreechCraft/releases/tag/${VERSION} /data
RUN chmod +x /data

VOLUME ["/data","/mods","/config"]
WORKDIR /data

CMD /start.sh
