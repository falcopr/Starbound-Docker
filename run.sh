#!/bin/bash
docker run -v ./starbound:/srv/starbound \
  -p 21025:21025 -p 21025:21025/udp -p 21026:21026 -p 21026:21026/udp \
# -e "STEAM_USERNAME=your_username" -e "STEAM_PASSWORD=your_password" \
  --name=starbound falcoprescher/starbound