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

并且，这时候你大概率会得到报错，因为没有配置 WSL 作为后端。而我翻了半天官方文档也没找到使用 CLI 配置 WSL 为后端的方法，因为这个功能似乎只能使用 Docker Desktop 实现。

而在 Windows 里， podman 却可以只使用 CLI 简单地运行容器

```sh
# 安装
scoop install podman
# 初始化 WSL 后端虚拟机
podman machine init
# 启动并连接到虚拟机
podman machine start
# 运行容器
podman run ubi8-micro date
```

不需要新打开一个管理员权限的终端，而且没有报错，此后都只需要运行后两个命令就能运行容器实例了

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

运行容器非常简单

```sh
# 启动并连接到虚拟机
podman machine start
# 运行容器
podman run ubi8-micro date
```

一些常用的查看容器和镜像的命令

```sh
# 列出本地存储的镜像
podman images
# 列出所有镜像，包括中间镜像
podman images -a
# 列出正在运行的容器
podman ps
# 列出所有容器
podman ps -a
```

### 网络代理

WSL 本质上是个虚拟机，而虚拟机的网络连接方式略微有点复杂，尤其是在宿主机使用了网络代理工具的情况下。

我目前的解决方案是：网络代理使用 TUN 模式；WSL Settings 里网络模式选择 Mirrored，并开启主机地址回环，或者你可以直接修改 Windows 系统里的 `~/.wslconfig` 文件

```ini
[wsl2]
networkingMode=Mirrored

[experimental]
hostAddressLoopback=true
```

不过，这种方法偶尔还是会出现问题。目前我找不到完美的解决方案，改善网络环境（没有暗指墙）应该是个最好的选择。

### 容器编排

podman 可以直接使用 `docker-compose`，这似乎也是默认的行为。而 `podman-compose` 在 Windows 环境里好像有点问题

安装 docker-compose 也是直接使用 Scoop 就行了，可以不用先安装 `docker`

```sh
scoop install docker-compose
```
