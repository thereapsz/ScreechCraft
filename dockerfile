#FROM adoptopenjdk/openjdk8-openj9:alpine-nightly
FROM openjdk:8-jre-alpine

LABEL maintainer "TheReapsZ"

#RUN addgroup -g 1000 minecraft
#RUN adduser -Ss /bin/false -u 1000 -G minecraft -h /home/minecraft minecraft

RUN mkdir -m 777 /data /data/mods /data/config
#RUN chown minecraft /data /data/mods /data/config

EXPOSE 25565


VOLUME ["/data","/mods","/config"]
#WORKDIR /data

#ARG VERSION=v1.0
#ADD https://github.com/thereapsz/ScreechCraft/releases/tag/${VERSION} /data
COPY . /data
#COPY start.sh /data

#USER minecraft

ADD ./start.sh /data
#RUN ["chmod", "+x", "/data/start.sh"]
RUN chmod -R a+x /data

#CMD /data/start.sh
USER frost
ENTRYPOINT ["/data/start.sh"]

#USER minecraft
