# docker rm $(docker stop <CONTAINER ID>)


docker container stop shadowsocksr

docker container rm shadowsocksr

# docker image rm xrosy/shadowsocksr

docker build --rm -f "Dockerfile" -t xrosy/shadowsocksr:latest .

docker run  -itd \
            --restart=always \
            --name=shadowsocksr \
            -v $PWD/conf:/usr/local/conf \
            -p 55223:51301 \
            # -p 55224:51301/udp \
            # -p 55225:51301 \
            # -p 55226:51301/udp \
            # -p 55227:51301 \
            # -p 55228:51301/udp \
            xrosy/shadowsocksr


# docker run  -it --name=shadowsocksr -v $PWD/conf:/usr/local/conf xrosy/shadowsocksr sh
# docker exec -it shadowsocksr sh
# docker rm $(docker stop shadowsocksr)