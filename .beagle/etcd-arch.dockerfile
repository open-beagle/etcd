ARG BASE

FROM ${BASE}

ARG AUTHOR
ARG VERSION

LABEL maintainer=${AUTHOR} version=${VERSION}

ARG TARGETOS
ARG TARGETARCH

ENV ETCD_UNSUPPORTED_ARCH=${TARGETARCH}

COPY ./dist/etcd-${TARGETOS}-${TARGETARCH} /usr/local/bin/etcd
COPY ./dist/etcdctl-${TARGETOS}-${TARGETARCH} /usr/local/bin/etcdctl

RUN mkdir -p /var/etcd/ && \
mkdir -p /var/lib/etcd/

EXPOSE 2379 2380

CMD ["/usr/local/bin/etcd"]