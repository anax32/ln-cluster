ARG LND_VERSION=v0.12.0-beta
FROM lightninglabs/lnd:$LND_VERSION

RUN apk add gettext

COPY scripts/create-env-conf.sh /usr/local/sbin/
COPY config/lnd-env.conf /config/

WORKDIR /
ENTRYPOINT ["/bin/bash", "-c"]

CMD ["create-env-conf.sh && cat config/tmp.conf && lnd --lnddir=/data -C=/config/tmp.conf"]
