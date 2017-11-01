docker stop starbound
docker rm $(docker ps -qa)
docker rmi $(docker images -f "dangling=true" -q)
docker rmi falcoprescher/starbound:1.0
# docker volume rm starbound
# docker volume prune
