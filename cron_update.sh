cd "${0%/*}"
./backup.sh
docker run --rm -v starbound:/starbound/data --entrypoint ./scripts/update_fur.sh falcoprescher/starbound:1.1
