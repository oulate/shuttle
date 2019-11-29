FROM alpine:latest

ENV SERVER_ADDR       0.0.0.0
ENV SERVER_PORT       51300
ENV LOCAL_PORT        1080
ENV PASSWORD          vps123456
ENV METHOD            chacha20-ietf
ENV PROTOCOL          auth_chain_a
ENV PROTOCOL_PARAM    itunes.apple.com
ENV OBFS              plain
ENV OBFS_PARAM        itunes.apple.com
ENV TIMEOUT           300

RUN mkdir -p /oulate/apps/ladder /oulate/conf /oulate/download && \
    apk add --no-cache python libsodium wget && \
    wget --no-check-certificate -qO- http://static.chenzhenyuan.com//public/ladder.tar.gz | tar -xzf - -C /oulate/apps/ladder

WORKDIR /oulate/apps/ladder

# VOLUME /oulate/conf/ladder.conf

EXPOSE 51300

# CMD python server.py -c /oulate/conf/ladder.conf
CMD python server.py  -m $METHOD -O $PROTOCOL -G $PROTOCOL_PARAM -o $OBFS -g $OBFS_PARAM -t $TIMEOUT -k $PASSWORD

################################################################################
#
# Usage:
#   docker rm $(docker stop ladder-x1)
#   docker build --rm -f "Dockerfile" -t xrosy/ladder:latest . && docker image prune
#   docker run -it --restart="always" --env="PASSWORD=foo" --name="ladder-x1" -p 51300:51300/tcp -p 51300:51300/udp "xrosy/ladder:latest"
#   docker exec -it ladder-x1 sh
#   docker logs ladder-x1
#
#   docker run  -itd --restart=always --name=ladder_x1 -v $PWD/ladder.conf.json:/usr/local/ladder/configs.json -p 51300:51300/tcp -p 51300:51300/udp xrosy/ladder:latest


################################################################################
# Help:
#   server          >> -s $SERVER_ADDR
#   server_port     >> -p $SERVER_PORT
#   local_port      >> -l $LOCAL_PORT
#   password        >> -k $PASSWORD
#   method          >> -m $METHOD
#   protocol        >> -O $PROTOCOL
#   protocol_param  >> -G $PROTOCOL_PARAM
#   obfs            >> -o $OBFS
#   obfs_param      >> -g $OBFS_PARAM
#   timeout         >> -t $TIMEOUT
#   local_address   >> -b $LOCAL_ADDRESS
#
#   fast_open       >> --fast-open