FROM ghcr.io/home-assistant/aarch64-base:3.19

# Community repo (freeradius suele estar aquí)
RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.19/community" >> /etc/apk/repositories

RUN apk update && apk add --no-cache \
  freeradius \
  freeradius-utils \
  openssl \
  make \
  bash \
  jq

COPY rootfs/ /
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
