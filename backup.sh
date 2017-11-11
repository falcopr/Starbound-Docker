#!/bin/bash
docker run -it -v starbound:/volume -v "$(pwd)/backup:/backup" debian:buster \
    tar -czf /backup/starbound-$(date +%Y-%m-%d_%H-%M-%S).tar.gz -C /volume ./
