# https://github.com/shadowsocksrr/shadowsocksr/archive/3.2.2.tar.gz

FROM alpine:3.10

# ENV SERVER_ADDR     0.0.0.0
# ENV SERVER_PORT     51301
# ENV PASSWORD        psw
# ENV METHOD          aes-128-ctr
# ENV PROTOCOL        auth_aes128_md5
# ENV PROTOCOLPARAM   32
# ENV OBFS            tls1.2_ticket_auth_compatible
# ENV TIMEOUT         120
# ENV DNS_ADDR        8.8.8.8
# ENV DNS_ADDR_2      8.8.4.4

RUN apk --no-cache add \
    python \
    libsodium \
    wget

RUN mkdir -p /usr/local/conf && \
    mkdir -p /usr/local/download

RUN wget --no-check-certificate -qO- https://github.com/shadowsocksrr/shadowsocksr/archive/3.2.2.tar.gz | tar -xzf - -C /usr/local/download && \
    cp -Rf /usr/local/download/shadowsocksr-3.2.2/shadowsocks /usr/local/shadowsocks


WORKDIR /usr/local/shadowsocks

EXPOSE 51301

VOLUME /usr/local/conf

# CMD python server.py -p $SERVER_PORT -k $PASSWORD -m $METHOD -O $PROTOCOL -o $OBFS -G $PROTOCOLPARAM
CMD python server.py --pid-file=$PWD/shadowsocksr.pid -c /usr/local/conf/shadowsocksr.json