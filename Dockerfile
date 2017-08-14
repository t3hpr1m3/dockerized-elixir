FROM alpine:3.6

MAINTAINER Josh Williams <vmizzle@gmail.com>

ENV REFRESHED_AT=2017-09-14 \
	ELIXIR_VERSION=1.5.1

RUN apk --update add erlang && \
	apk add --virtual build-dependencies wget ca-certificates && \
	wget --no-check-certificate https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip && \
	mkdir -p /opt/elixir-${ELIXIR_VERSION}/ && \
	unzip Precompiled.zip -d /opt/elixir-${ELIXIR_VERSION}/ && \
	rm Precompiled.zip && \
	apk del build-dependencies && \
	rm -rf /etc/ssl && \
	rm -rf /var/cache/apk/*

CMD ["/bin/sh"]
