# /bin/bash

set -ex

export GO_LDFLAGS="-s -w"

export GOARCH=amd64 
make build
mkdir -p bin/linux-$GOARCH/
mv bin/etcd bin/linux-$GOARCH/etcd
mv bin/etcdctl bin/linux-$GOARCH/etcdctl
mv bin/etcdutl bin/linux-$GOARCH/etcdutl

export GOARCH=arm64 
make build
mkdir -p bin/linux-$GOARCH/
mv bin/etcd bin/linux-$GOARCH/etcd
mv bin/etcdctl bin/linux-$GOARCH/etcdctl
mv bin/etcdutl bin/linux-$GOARCH/etcdutl

export GOARCH=ppc64le 
make build
mkdir -p bin/linux-$GOARCH/
mv bin/etcd bin/linux-$GOARCH/etcd
mv bin/etcdctl bin/linux-$GOARCH/etcdctl
mv bin/etcdutl bin/linux-$GOARCH/etcdutl

export GOARCH=mips64le 
export ETCD_UNSUPPORTED_ARCH=mips64le
make build
mkdir -p bin/linux-$GOARCH/
mv bin/etcd bin/linux-$GOARCH/etcd
mv bin/etcdctl bin/linux-$GOARCH/etcdctl
mv bin/etcdutl bin/linux-$GOARCH/etcdutl