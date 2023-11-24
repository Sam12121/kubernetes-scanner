FROM golang:1.20-bullseye AS build

WORKDIR /home/toae/src/kubernetes-scanner
COPY . .
RUN go build -o kubernetes-scanner . \
    && chmod 777 kubernetes-scanner \
    && cp /home/toae/src/kubernetes-scanner/kubernetes-scanner /home/toae/ \
    && rm -r /home/toae/src/*

FROM debian:bullseye-slim
MAINTAINER Toae Inc
LABEL toae.role=system

RUN apt-get update \
    && apt-get install -y bash curl wget git \
    && /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/turbot/steampipe/main/install.sh)" \
    && useradd -rm -d /home/toae -s /bin/bash -g root -G sudo -u 1001 toae

USER toae

COPY --from=build /home/toae/kubernetes-scanner /usr/local/bin/kubernetes-scanner
WORKDIR /opt/steampipe

USER root
ENV VERSION=2.0.0

RUN chown toae /opt/steampipe /usr/local/bin/kubernetes-scanner

USER toae
RUN steampipe plugin install steampipe@0.7.0 \
    && steampipe plugin install kubernetes@0.18.1 \
    && git clone https://github.com/turbot/steampipe-mod-kubernetes-compliance.git

ENTRYPOINT ["/usr/local/bin/kubernetes-scanner"]
