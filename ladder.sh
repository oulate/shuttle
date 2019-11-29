# docker rm $(docker stop <CONTAINER ID>)
#
# ---------------------------------------------------------------------------- #
#
# Usage:
#   docker rm $(docker stop ladder-x1)
#   docker build --rm -f "Dockerfile" -t oulate/ladder:latest . && docker image prune
#   docker run -it --restart="always" --env="PASSWORD=foo" --name="ladder-x1" -p 51300:51300/tcp -p 51300:51300/udp "xrosy/ladder:latest"
#   docker exec -it ladder-x1 sh
#   docker logs ladder-x1