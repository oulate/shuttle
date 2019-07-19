# docker rm $(docker stop <CONTAINER ID>)


docker container stop shadowsocksr

docker container rm shadowsocksr

# docker image rm xrosy/shadowsocksr

docker build --rm -f "Dockerfile" -t xrosy/shadowsocksr:latest .

docker run  -itd \
            --restart=always \
            --name=shadowsocksr \
            -v $PWD/conf:/usr/local/conf \
            -p 51321:51301 \
            -p 51322:51301/udp \
            -p 51323:51301 \
            -p 51324:51301/udp \
            -p 51325:51301 \
            -p 51326:51301/udp \
            xrosy/shadowsocksr


# docker run  -it --name=shadowsocksr -v $PWD/conf:/usr/local/conf -p 55223:51301 xrosy/shadowsocksr sh
# docker exec -it shadowsocksr sh
# docker rm $(docker stop shadowsocksr)