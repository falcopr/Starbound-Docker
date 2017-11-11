cd "${0%/*}"
screen kill starbound
docker stop starbound
./backup.sh
docker run --rm -v starbound:/starbound/data --entrypoint ./scripts/update_fur.sh falcoprescher/starbound:1.1
./start.screen.sh
