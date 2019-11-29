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
    wget --no-check-certificate -qO- https://github.com/oulate/ladder/releases/download/3.2.2/ladder.tar.gz | tar -xzf - -C /oulate/apps/ladder

WORKDIR /oulate/apps/ladder

# VOLUME /oulate/conf/ladder

EXPOSE 51300

# CMD python server.py -c /oulate/conf/ladder/service.conf
CMD python server.py  -m $METHOD -O $PROTOCOL -G $PROTOCOL_PARAM -o $OBFS -g $OBFS_PARAM -t $TIMEOUT -k $PASSWORD
