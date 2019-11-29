# docker rm $(docker stop <CONTAINER ID>)
#
# ---------------------------------------------------------------------------- #
#
# Usage:
#   docker rm $(docker stop ladder-x1)
#   docker build --rm -f "Dockerfile" -t oulate/ladder:latest . && docker image prune
#   docker run -itd --restart="always" --env="PASSWORD=vps666888" --name="ladder-x1" -p 51301:51300/tcp -p 51301:51300/udp "oulate/ladder:latest"
#   docker exec -it ladder-x1 sh
#   docker logs ladder-x1