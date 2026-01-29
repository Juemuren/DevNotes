# WSL

## 简介

WSL 是 Windows 下的 Linux 子系统，提供了原生而非移植的 Linux 环境。

WSL 在虚拟机里运行 Linux 内核，因此理论上所有 Linux 能运行的软件 WSL 都能运行。

## 安装

[官方安装教程](https://learn.microsoft.com/windows/wsl/install)

在较新的 Windows 机器上安装 WSL 非常简单

```sh
# 下载默认的发行版
wsl --install
# 下载特定的发行版
wsl --install Ubuntu-24.04
```

WSL 提供了多种 Linux 发行版，一般来说选择 Ubuntu 就行

```sh
# 查看所有可下载的发行版
wsl -l -o
# 查看目前已下载的发行版
wsl -l -v
```

## 使用

WSL 使用起来也非常简单

```sh
# 启动特定的发行版
wsl -d Ubuntu-24.04
# 将发行版设为默认值
wsl --set-default Ubuntu-24.04
# 终止所有正在运行的虚拟机
wsl --shutdown
```

WSL 还有更高级的用法，比如可以像 `sh` 一样执行单条命令

```sh
# 用默认发行版运行命令
wsl date
# 可以添加参数
wsl uname -a
```

## 设置

### 网络代理

WSL 本质上是个虚拟机，而虚拟机的网络连接方式略微有点复杂，尤其是在宿主机使用了网络代理工具的情况下。

我目前的解决方案大概如下

1. 尝试网络代理使用 TUN 模式能不能解决
2. 尝试更改 WSL Settings，比如网络模式选择 `Mirrored`，并开启 `主机地址回环`

不过，这些方法偶尔还是会出现问题。目前我找不到完美的解决方案，改善网络环境应该是个最好的选择。
