# Fzf

## 简介

Fzf 是个模糊查找器，可以对提供的输入进行模糊查找，某种程度上可以看作一个交互式的 grep

## 安装

```sh
# Windows
scoop install fzf
# Linux
brew install fzf
```

## Shell 集成

Fzf 原生只支持 bash、zsh 和 fish 的集成。要启用 Shell 集成，需把以下命令添加到配置文件里

```sh
# bash ~\.bashrc
eval "$(fzf --bash)"
# zsh ~\.zshrc
source <(fzf --zsh)
```

对于 pwsh，则需要额外安装模块 [PSFzf](https://github.com/kelleyma49/PSFzf) 来启用集成

```sh
Install-Module -Name PSFzf
```

然后可以添加以下命令到配置文件 `$PROFILE` 中

```sh
# 启用模块
Import-Module PSFzf
# 覆盖 PSReadline 的按键绑定
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
```

## 使用

Fzf 功能非常强大，用法很多，建议去看[官方文档里的演示](https://junegunn.github.io/fzf/getting-started/#an-example)

Fzf 使用 `TUI` 作为交互界面，输入字符后就会用这些字符进行模糊查找。

### 命令历史记录搜索

如果启用了 Shell 集成，那么按下 `Ctrl+r` 就可以逆序搜索命令历史记录。如果你想重复运行之前的某个只有模糊记忆的命令，那么这非常有帮助

### 文件和目录搜索

如果启用了 Shell 集成，那么按下 `Ctrl+t` 就可以搜索当前目录下的文件夹和文件。这让切换目录、搜索文件等许多操作都更加方便了

### 管道

把别的命令的输出通过管道提供给 fzf，就可以交互式搜索该命令的输出。对于那种输出很长，而我们只关注其中一部分的命令而言，非常好用

比如我想查看当前某个进程的状态，但不太清楚进程的全名，只知道名字可能包含 *foo*。传统的方法可能是 `ps | grep 'foo'`，但这样大概率会显示一堆我们不关心的但名字却包含 *foo* 的进程，而且如果记错了名字，我们得再运行一遍 `ps | grep 'bar'` ；而使用 `ps | fzf`，你可以在一个交互式的界面中浏览进程状态，非常方便
