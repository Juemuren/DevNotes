# Tldr

## 简介

tldr 是一个友好的命令手册，专门为懒人准备的。

tldr 由数据库和客户端组成。客户端就是一个 `TUI` 界面，而数据库在 Github 上，会缓存到本地，需要定期更新

## 对比

获取命令手册的方式非常多。除了大多数命令自带的 `--help` 参数外，大多数 UNIX 系统都支持使用 `man` 获取更详细的说明，并且许多工具还可以通过访问官方文档来了解如何使用。

但某些时候我们只想快点使用工具，懒得去阅读这些东西。tldr 就是为此准备的，它的全称为 *Too Long Don't Read*，即 *太长不看* 的意思。

`tldr` 不会给出详细的文档，而是只给出具体的示例。你可以选择其中的一种用法，然后该工具会指导你输入应该被替换掉的参数

## 安装

在 Windows 上可以通过 Scoop 安装

```sh
scoop install tldr
```

在 Linux 上可以通过 Homebrew 安装。不过原来的 `tldr` 将被弃用了，可以安装新的、用 Rust 重写的客户端

```sh
brew install tlrc
```

## 使用

既然这个工具就是为懒人准备的，那么它的使用就应该是简单的

```sh
# 询问怎么使用 git
tldr git
# 询问怎么使用 git submodule
tldr git submodule
```

更新数据库也很简单

```sh
tldr -u
```

当然了，你也可以用 tldr 询问如何使用 tldr

```sh
tldr tldr
```
