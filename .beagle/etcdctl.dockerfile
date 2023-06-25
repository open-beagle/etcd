ARG BASE

FROM ${BASE}

ARG AUTHOR
ARG VERSION

LABEL maintainer=${AUTHOR} version=${VERSION}

ARG TARGETOS
ARG TARGETARCH

COPY ./bin/${TARGETOS}-${TARGETARCH}/etcdctl /usr/local/bin/etcdctl
COPY ./bin/${TARGETOS}-${TARGETARCH}/etcdutl /usr/local/bin/etcdutl