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



RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    mkdir -p /oulate/apps/shuttle /oulate/conf /oulate/download && \
    apk add --no-cache python3 libsodium wget

ADD ./shuttle /oulate/apps/shuttle

WORKDIR /oulate/apps/shuttle

EXPOSE 51300

# CMD python server.py -c /oulate/conf/ladder/service.conf
CMD python3 server.py  -m $METHOD -O $PROTOCOL -G $PROTOCOL_PARAM -o $OBFS -g $OBFS_PARAM -t $TIMEOUT -k $PASSWORD