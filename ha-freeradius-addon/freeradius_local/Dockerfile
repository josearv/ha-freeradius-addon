ARG BUILD_FROM
FROM $BUILD_FROM

RUN apk add --no-cache \
  freeradius \
  freeradius-eap \
  freeradius-mschap \
  freeradius-utils \
  bash \
  jq

COPY rootfs/ /
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
