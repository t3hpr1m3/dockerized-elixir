FROM jdubz/erlang:22.3.4

MAINTAINER Josh Williams <vmizzle@gmail.com>

ENV REFRESHED_AT=2020-06-08 \
	ELIXIR_VERSION=1.10.3

RUN apk add --no-cache --virtual .elixir-build \
		build-base \
		wget && \
	wget -P /tmp -nv https://github.com/elixir-lang/elixir/archive/v${ELIXIR_VERSION}.tar.gz && \
	tar -C /tmp -xzf /tmp/v${ELIXIR_VERSION}.tar.gz && \
	rm /tmp/v${ELIXIR_VERSION}.tar.gz && \
	cd /tmp/elixir-${ELIXIR_VERSION} && \
	make && DESTDIR=/opt/elixir make install && \
	export PATH=$PATH:/opt/elixir/usr/local/bin && \
	cd / && rm -rf /tmp/elixir-${ELIXIR_VERSION} && \
	apk del --force .elixir-build

ENV PATH $PATH:/opt/elixir/usr/local/bin
