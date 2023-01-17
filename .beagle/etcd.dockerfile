ARG BASE

FROM ${BASE}

ARG AUTHOR
ARG VERSION

LABEL maintainer=${AUTHOR} version=${VERSION}

ARG TARGETOS
ARG TARGETARCH

COPY ./dist/etcd-${TARGETOS}-${TARGETARCH} /usr/local/bin/etcd
COPY ./dist/etcdctl-${TARGETOS}-${TARGETARCH} /usr/local/bin/etcdctl
COPY ./dist/etcdutl-${TARGETOS}-${TARGETARCH} /usr/local/bin/etcdutl

RUN mkdir -p /var/etcd/ && \
mkdir -p /var/lib/etcd/

EXPOSE 2379 2380

CMD ["/usr/local/bin/etcd"]