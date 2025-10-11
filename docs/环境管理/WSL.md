# WSL

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
