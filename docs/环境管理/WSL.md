# WSL

## 简介

WSL 是 Windows 下的 Linux 子系统，提供了原生而非移植的 Linux 环境。

WSL 的原理就是在虚拟机里运行 Linux 内核，因此理论上所有 Linux 能运行的软件 WSL 都能运行。

WSL 可以安装多种 Linux 发行版。目前能直接安装的就有 19 种。

## 安装

[官方安装教程](https://learn.microsoft.com/zh-cn/windows/wsl/install)

在较新的 Windows 机器上安装 WSL 非常简单。

```sh
# 下载默认的发行版
wsl --install
# 下载特定的发行版
wsl --install -d Ubuntu-24.04
```

你可以使用以下命令查看哪些可用的发行版

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
