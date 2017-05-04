FROM alpine:edge

RUN apk add --no-cache dumb-init su-exec
RUN echo http://dl-cdn.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
	apk add --no-cache confd

RUN apk add --no-cache umurmur

COPY ["entrypoint.sh", "/entrypoint.sh"]
COPY ["confd/conf.d/umurmur.toml", "/etc/confd/conf.d/umurmur.toml"]
COPY ["confd/templates/umurmur.conf.tmpl", "/etc/confd/templates/umurmur.conf.tmpl"]

EXPOSE 64738/udp 64738/tcp

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/umurmurd", "-d", "-c", "/umurmur.conf"]
