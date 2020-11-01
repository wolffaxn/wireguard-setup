FROM debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive
RUN set -eux; \
    apt-get update -qq; \
    apt-get install -qq --no-install-recommends \
    ca-certificates \
    genisoimage \
    ; \
    rm -Rf /var/lib/apt/lists/*
