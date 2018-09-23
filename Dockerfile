FROM jdubz/erlang:21.0.9

MAINTAINER Josh Williams <vmizzle@gmail.com>

ENV REFRESHED_AT=2018-09-23 \
	ELIXIR_VERSION=1.7.2

RUN wget --no-check-certificate https://github.com/elixir-lang/elixir/releases/download/v${ELIXIR_VERSION}/Precompiled.zip && \
	mkdir -p /opt/elixir-${ELIXIR_VERSION}/ && \
	unzip Precompiled.zip -d /opt/elixir-${ELIXIR_VERSION}/ && \
	rm Precompiled.zip

ENV PATH $PATH:/opt/elixir-${ELIXIR_VERSION}/bin
