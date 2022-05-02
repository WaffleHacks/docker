FROM alpine:3 as certs

RUN apk update && apk upgrade
RUN apk add ca-certificates && update-ca-certificates

FROM alpine:3

ENV FALLBACK_DNS="1.1.1.1 1.0.0.1"
ENV REDIS_URL=""
ENV REDIS_PREFIX=""

COPY --from=certs /etc/ssl/certs /etc/ssl/certs
ADD coredns /coredns
ADD entrypoint.sh /entrypoint.sh

EXPOSE 53 53/udp
ENTRYPOINT [ "/bin/sh", "-c", "/entrypoint.sh" ]
