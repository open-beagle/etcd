ARG BASE

FROM ${BASE}

ARG AUTHOR
ARG VERSION

LABEL maintainer=${AUTHOR} version=${VERSION}

ARG TARGETOS
ARG TARGETARCH

ENV ETCD_UNSUPPORTED_ARCH=${TARGETARCH}

COPY ./bin/${TARGETOS}-${TARGETARCH}/etcd /usr/local/bin/etcd
COPY ./bin/${TARGETOS}-${TARGETARCH}/etcdctl /usr/local/bin/etcdctl
COPY ./bin/${TARGETOS}-${TARGETARCH}/etcdutl /usr/local/bin/etcdutl

RUN mkdir -p /var/etcd/ && \
mkdir -p /var/lib/etcd/

EXPOSE 2379 2380

CMD ["/usr/local/bin/etcd"]