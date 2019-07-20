# docker rm $(docker stop <CONTAINER ID>)


docker rm $(docker stop shadowsocksr)

# docker image rm xrosy/shadowsocksr

docker build --rm -f "Dockerfile" -t xrosy/shadowsocksr:latest .

docker run  -itd \
            --restart=always \
            --name=shadowsocksr \
            -v $PWD/conf:/usr/local/conf \
            -p 51321:51301/tcp \
            -p 51361:51301/udp \
            xrosy/shadowsocksr


# docker run  -it --name=shadowsocksr -v $PWD/conf:/usr/local/conf -p 55223:51301 xrosy/shadowsocksr sh
# docker exec -it shadowsocksr sh
# docker rm $(docker stop shadowsocksr)