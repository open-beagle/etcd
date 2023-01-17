# version

<!-- https://github.com/etcd-io/etcd -->

```bash
git remote add upstream git@github.com:etcd-io/etcd.git

git fetch upstream

git merge v3.5.6
```

## debug

```bash
# cache etcd
docker run -it \
--rm \
-v $PWD/:/go/src/go.etcd.io/etcd/v3 \
-w /go/src/go.etcd.io/etcd/v3 \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.19-alpine \
rm -rf vendor && go mod tidy && go mod vendor

# cache etcdctl
docker run -it \
--rm \
-v $PWD/etcdctl/:/go/src/go.etcd.io/etcd/etcdctl/v3 \
-w /go/src/go.etcd.io/etcd/etcdctl/v3 \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.19-alpine \
rm -rf vendor && go mod tidy && go mod vendor

# cache etcdutl
docker run -it \
--rm \
-v $PWD/etcdutl/:/go/src/go.etcd.io/etcd/etcdutl/v3 \
-w /go/src/go.etcd.io/etcd/etcdutl/v3 \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.19-alpine \
rm -rf vendor && go mod tidy && go mod vendor

# build
docker run -it \
--rm \
-v $PWD/:/go/src/go.etcd.io/etcd/ \
-w /go/src/go.etcd.io/etcd/ \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.19-alpine \
bash .beagle/build.sh
```

## cache

```bash
# 构建缓存-->推送缓存至服务器
docker run --rm \
  -e PLUGIN_REBUILD=true \
  -e PLUGIN_ENDPOINT=$PLUGIN_ENDPOINT \
  -e PLUGIN_ACCESS_KEY=$PLUGIN_ACCESS_KEY \
  -e PLUGIN_SECRET_KEY=$PLUGIN_SECRET_KEY \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="etcd" \
  -e PLUGIN_MOUNT=".git,vendor" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0

# 读取缓存-->将缓存从服务器拉取到本地
docker run --rm \
  -e PLUGIN_RESTORE=true \
  -e PLUGIN_ENDPOINT=$PLUGIN_ENDPOINT \
  -e PLUGIN_ACCESS_KEY=$PLUGIN_ACCESS_KEY \
  -e PLUGIN_SECRET_KEY=$PLUGIN_SECRET_KEY \
  -e DRONE_REPO_OWNER="open-beagle" \
  -e DRONE_REPO_NAME="etcd" \
  -v $(pwd):$(pwd) \
  -w $(pwd) \
  registry.cn-qingdao.aliyuncs.com/wod/devops-s3-cache:1.0
```
