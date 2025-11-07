# Docker

## 简介

Docker 代表了容器技术。所谓容器，就是个把应用程序及其运行环境打包在一起的东西。你可以把容器给别人使用，也可以使用别人的容器。现在似乎还留行直接在容器里进行开发，省去了所有配置开发环境的麻烦。

## 对比

我个人目前推荐使用 Podman 作为容器工具。就算不考虑架构更先进、安全性更好等原因，单从命令行易用性的角度来说，podman 也比 docker 更好。不过 Docker Desktop 有图形界面，也许部分人更喜欢，但我不是很喜欢。

如果不使用 Docker Desktop，只使用 Docker CLI，那么启动一个容器会非常麻烦。下面是在 Windows 系统里使用 Docker 运行一个容器需要的步骤

```sh
# 安装 Docker CLI
scoop install docker
# 然后以管理员权限启动新的终端，因为后面的命令需要管理员权限
# 将守护进程注册为服务
dockerd --register-service
# 启动守护进程
sasv docker
# 运行容器
docker run hello-world
```

并且，这时候你大概率会得到报错，因为在 Windows 上 `dockerd` 只支持运行 Windows 容器。一个可能正确的做法应该是这样的

1. 在 WSL 里安装 Docker 并启动守护进程 `dockerd`。当然，这个过程是需要 root 权限的
2. 然后在 Windows 里安装 Docker，并通过配置让 `docker` 连接到 WSL 里的 `dockerd`

好吧这太复杂了。让我们看看在 Windows 里 podman 要怎么只使用 CLI 运行容器吧

```sh
# 安装 Podman CLI
scoop install podman
# 初始化一个 WSL 虚拟机
podman machine init
# 启动并连接到虚拟机
podman machine start
# 运行容器
podman run hello
```

不需要新打开一个管理员权限的终端，不需要复杂的配置，除了可能的网络问题外即使是第一次使用也基本上不会遇到报错

## 安装

[podman for windows 官方文档](https://github.com/containers/podman/blob/main/docs/tutorials/podman-for-windows.md)

我使用 Scoop 安装

```sh
scoop install podman
```

然后初始化 WSL 后端虚拟机

```sh
podman machine init
```

这个虚拟机本体不是特别大（大约 2 G），但存储的镜像多了的话文件会变得很大。这个虚拟机默认存储在 `~\.local\share\containers\podman\machine\wsl` 目录下，如果需要更改位置的话请查阅官方文档。

## 使用

用 podman 运行别的命令前，记得先启动虚拟机

```sh
podman machine start
```

### 基本使用

```sh
# 在 ubi8-micro 容器里运行 date 命令
podman run ubi8-micro date
# 与 ubi8-micro 容器交互
podman run -it ubi8-micro
```

不过 `ubi8-micro` 这个镜像非常小，只有 **25.8 MB**，因此功能有限。你可以拉取一个更大的镜像来玩

```sh
# 拉取 ubuntu 镜像并运行 bash
podman run -it ubuntu bash
# 可以为这个容器实例取个名字
podman run -it --name hello-ubuntu ubuntu bash
```

### 保存镜像

> [!Note] 镜像和容器
> 镜像和容器是两个很容易混淆的概念，两者之间的关系大概就是
>
> - 镜像是不变的，而容器是可变的
> - 每次运行镜像，比如 `podman run -it ubuntu bash`，实际上都创建了一个新的容器实例
> - 可以通过命令，比如 `podman commit container-id new-image-name`，将一个修改过的容器保存为新的镜像
>
> 这是一些常用的查看容器和镜像的命令，你可以自己对比一下有什么区别
>
> ```sh
> # 列出存储的镜像
> podman images
> # 列出所有镜像，包括中间镜像
> podman images -a
> # 列出正在运行的容器
> podman ps
> # 列出所有容器，包括已停止的容器
> podman ps -a
> ```
>
> 本文不会纠结这两个概念的细致区别，因此可能存在不准确的地方

可以通过以下命令启动容器实例和停止容器实例，其中 `CONTAINER-ID` 和 `CONTAINER-NAME` 可以通过 `podman ps -a` 查看

```sh
# 启动容器实例
podman start -ai CONTAINER-ID/CONTAINER-NAME
# 停止容器实例
podman kill CONTAINER-ID/CONTAINER-NAME
```

当你对容器做出了一些修改后，可以通过 `commit` 进行保存

```sh
podman commit CONTAINER-ID/CONTAINER-NAME NEW-IMAGE-NAME
```

这会本地生成一个新的镜像，然后你可以基于这个镜像再创建新的容器实例

### 修改容器

除了通过 `podman run -it ubuntu bash` 这种方式在交互式 shell 会话中对容器进行操作外，还有别的修改容器的方式

```sh
# 把本地文件复制到容器中
podman container cp index.js hello-node:/usr/src/app/index.js
```

不过，以上这些自己手动修改容器再保存为新镜像的做法不是创建容器镜像的最佳方法。一个更好的方法是使用 `Dockerfile`，这通过一个配置文件来让创建镜像的过程自动化

```dockerfile
FROM node:20

WORKDIR /usr/src/app

COPY ./index.js ./index.js

CMD node index.js
```

```sh
# 根据配置文件自动构建镜像
podman build -t node-hello-world .
# 运行容器
podman run node-hello-world
# 可以覆盖默认的命令
podman run -it node-hello-world bash
# 还可以重新映射端口
podman run -p 3123:3000 express-server
```

### 管理存储空间

一些用来管理存储空间的命令

```sh
# 列出存储概览
podman system df
# 列出存储详情
podman system df -v
# 一键清理
podman system prune
```

### 容器编排

podman 可以直接使用 `docker-compose`，这似乎也是默认的行为。而 `podman-compose` 在 Windows 环境里好像有点问题

安装 docker-compose 也是直接使用 Scoop 就行了，可以不用先安装 `docker`

```sh
scoop install docker-compose
```
