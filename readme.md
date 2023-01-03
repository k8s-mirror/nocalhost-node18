# nocalhost node19 nestjs image

[dev-container]

[开发镜像]

[pnpm]

[node-docker]

[node-docker]: https://hub.docker.com/_/node/
[dev-container]: https://github.com/nocalhost/dev-container
[开发镜像]: https://nocalhost.dev/zh-CN/docs/config/config-dev-container-en#%E5%BC%80%E5%8F%91%E9%95%9C%E5%83%8F
[pnpm]: https://pnpm.io/installation

## 创建镜像

```sh
  cd dir
  docker build -t nocalhost-node18 .
```

## 运行镜像

```sh
  docker run -it --rm nocalhost-node18 /bin/zsh
  docker ps
```

## 推送镜像

```sh
docker images
docker tag def5ee20a468-imageid k8scopy/nocalhost-node18:v1.0.1
docker push k8scopy/nocalhost-node18:v1.0.1
```

## 磁盘清理

查看

```sh
  docker system df
```

清理

```sh
docker system prune -a
```
