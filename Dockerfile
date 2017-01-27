FROM alpine:3.3
MAINTAINER <jan@rancher.com>

EXPOSE 80

RUN apk add --no-cache ca-certificates

ENV LETSENCRYPT_RELEASE v0.3.0

ADD https://github.com/janeczku/rancher-letsencrypt/releases/download/${LETSENCRYPT_RELEASE}/rancher-letsencrypt-linux-amd64.tar.gz /tmp/rancher-letsencrypt.tar.gz

RUN tar -zxvf /tmp/rancher-letsencrypt.tar.gz -C /usr/bin \
	&& chmod +x /usr/bin/rancher-letsencrypt

ENTRYPOINT ["/usr/bin/rancher-letsencrypt"]