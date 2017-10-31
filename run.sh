#!/bin/bash

docker volume create starbound

docker run -d --name starbound \
    --mount "source=starbound,target=/starbound/data" \
    -p 21025:21025 -p 21025:21025/udp -p 21026:21026 -p 21026:21026/udp \
#   -e "STEAM_USERNAME=your_username" -e "STEAM_PASSWORD=your_password" \
    falcoprescher/starbound:1.0
