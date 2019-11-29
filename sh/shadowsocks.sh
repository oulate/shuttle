# docker rm $(docker stop <CONTAINER ID>)


docker rm $(docker stop shadowsocksr)

# docker image rm xrosy/shadowsocksr

docker build --rm -f "Dockerfile" -t xrosy/ssr:latest .

docker run  -itd --restart=always --name=shadowsocksr -v $PWD/conf:/usr/local/conf -p 51321:51301/tcp -p 51361:51301/udp xrosy/shadowsocksr


# docker run  -it --name=shadowsocksr -v $PWD/conf:/usr/local/conf -p 55223:51301 xrosy/shadowsocksr sh
# docker exec -it shadowsocksr sh
# docker rm $(docker stop shadowsocksr)


docker run -d \
           -v /xrosy/app/oneindex/config:/var/www/html/config \
           -v /xrosy/app/oneindex/cache:/var/www/html/cache \
           -e REFRESH_TOKEN='0 * * * *' \
           -e REFRESH_CACHE='*/10 * * * *' \
           --name oneindex \
           --restart=always \
           setzero/oneindex