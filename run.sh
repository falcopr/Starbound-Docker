#!/bin/bash
docker run -v "$(pwd)/starbound/data:/starbound/data" \
  -p 21025:21025 -p 21025:21025/udp -p 21026:21026 -p 21026:21026/udp \
# -e "STEAM_USERNAME=your_username" -e "STEAM_PASSWORD=your_password" \
  --name starbound falcoprescher/starbound:1.0
