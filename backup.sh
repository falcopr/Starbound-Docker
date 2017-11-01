docker run -it -v starbound:/volume -v "$(pwd)/backup:/backup" debian:buster \
    tar -czf /backup/starbound-$(date +%Y-%m-%d).tar.gz -C /volume ./
