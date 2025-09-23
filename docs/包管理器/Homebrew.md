# Homebrew

## 简介

Homebrew 是 MacOS 和 Linux 平台的包管理器

## 对比

我没用过 MacOS，所以只说 Linux 好了。

Linux 通常自带 *系统包管理器*，但系统包管理器安装东西通常都会需要 `root` 权限，而且为了系统稳定，更新并不及时，可能软件包也并不丰富。而 Homebrew 是在用户级别安装软件，不会污染系统环境，因此不需要 `sudo`；并且后者包数量更丰富，版本更新也更快。单从用户体验的角度来说，我觉得 Homebrew 比系统自带的包管理器更好。

## 安装

安装的命令就在[官网主页](https://brew.sh/)

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## 使用

几乎所有包管理器的基本使用方法都是差不多的

```sh
# 安装包
brew install fzf
# 查看所有已安装的包
brew list
# 查看指定安装的包
brew list --installed-on-request
# 更新包
brew upgrade fzf
# 卸载包
brew uninstall fzf
```

更复杂的用法建议参考[官方参考手册](https://docs.brew.sh/Manpage)
