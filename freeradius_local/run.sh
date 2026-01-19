FROM ghcr.io/home-assistant/aarch64-base:3.19

RUN echo "https://dl-cdn.alpinelinux.org/alpine/v3.19/community" >> /etc/apk/repositories

RUN apk update && apk add --no-cache \
  freeradius \
  freeradius-utils \
  openssl \
  ca-certificates \
  make \
  bash \
  jq

# En Alpine el módulo EAP puede venir con nombres distintos según build/repo.
# Probamos varios sin romper el build si alguno no existe.
RUN apk add --no-cache freeradius-eap 2>/dev/null || true
RUN apk add --no-cache freeradius-mod-eap 2>/dev/null || true
RUN apk add --no-cache freeradius-mods 2>/dev/null || true

COPY rootfs/ /
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
