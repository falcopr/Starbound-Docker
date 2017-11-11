#!/bin/bash
docker run --rm -d --name starbound_backup -v starbound:/volume -v "$(pwd)/backup:/backup" debian:buster \
    tar -czf /backup/starbound-$(date +%Y-%m-%d_%H-%M-%S).tar.gz -C /volume ./
