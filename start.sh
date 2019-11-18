#!/bin/bash

echo eula=true > /data/eula.txt

java -Xms6G -Xmx6G -XX:+UseG1GC -XX:+UnlockExperimentalVMOptions \
            -XX:MaxGCPauseMillis=100 -XX:+DisableExplicitGC \
            -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 \
            -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 \
            -XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled \
            -Dusing.aikars.flags=mcflags.emc.gs -jar forge-1.12.2-14.23.5.2847-universal.jar nogui
