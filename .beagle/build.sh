# /bin/bash

mkdir -p dist

set -ex
export GOARCH=amd64 
make build
mv bin/etcd dist/etcd-linux-$GOARCH
mv bin/etcdctl dist/etcdctl-linux-$GOARCH
mv bin/etcdutl dist/etcdutl-linux-$GOARCH

export GOARCH=arm64 
make build
mv bin/etcd dist/etcd-linux-$GOARCH
mv bin/etcdctl dist/etcdctl-linux-$GOARCH
mv bin/etcdutl dist/etcdutl-linux-$GOARCH

export GOARCH=ppc64le 
make build
mv bin/etcd dist/etcd-linux-$GOARCH
mv bin/etcdctl dist/etcdctl-linux-$GOARCH
mv bin/etcdutl dist/etcdutl-linux-$GOARCH

export GOARCH=mips64le 
make build
mv bin/etcd dist/etcd-linux-$GOARCH
mv bin/etcdctl dist/etcdctl-linux-$GOARCH
mv bin/etcdutl dist/etcdutl-linux-$GOARCH