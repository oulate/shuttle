#!/usr/bin/env shell

# 构建
docker build --rm -t oulate/shuttle . && docker image prune -f

# 启动
docker run -itd --restart="always" --env="PASSWORD=vps123456" --name="shuttle-x1" -p 51391:51300/tcp -p 51391:51300/udp oulate/shuttle:latest


docker exec -it shuttle-x1 ash

docker rm `docker stop shuttle-x1`