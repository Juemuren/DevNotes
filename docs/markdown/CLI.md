<!-- TODO CLI-->
# CLI

## 基本概念

**命令行界面**（CLI），是一个和**图形用户界面**（GUI）相对的概念：

  - 在命令行界面里，用户输入文本命令来执行操作
  - 在图形用户界面里，用户使用按钮或类似的元素来执行操作

**终端**（Terminal）提供了一个命令行界面，并且运行着 `shell`。shell 是一类程序，会接收输入、执行命令并输出结果。因此终端让你可以输入文本命令来和操作系统交互。

可以认为 shell 就是一个 CLI 程序。所有的系统都会自带 shell。在 Linux 发行版里，这通常是 `bash`。在 Windows 里，这通常是 `cmd` 和 `powershell`。

除了 shell 外，包管理器也是一类很重要的 CLI 程序。同样的，大多数系统都会自带包管理器。在 Linux 发行版里，可能是 `apt`、`pacman`、`yum` 等。在较新的 Windows 里，这是 `winget`。

此外还有一类被称为 `coreutils` 的程序，它们是系统的核心程序。提供了文件操作、文本处理、获取信息等基本功能。比如 GNU 的 `ls`、`cp`、`mv`、`rm`、`cat`、`echo`、`pwd`、`env`、`ps`、`uname` 等。它们通常会被预装在 Linux 发行版上。而 Windows 系统似乎并没有预装这些 CLI 程序，可能是由于用户更习惯使用 GUI。不过 `powershell` 似乎以内置命令的方式实现了部分核心程序。

然而以上仅仅是 CLI 程序的冰山一角。CLI 程序非常多，可能比你所知道的、有图形界面的软件还多。它们之中虽然大多都不会预装在系统里，但有时可以显著提高开发效率。作为开发者，简要了解一下这些 CLI 工具还是很有用的。

当然，本教程不会介绍哪些预装在大多数系统里的 CLI 程序。因为那样教程就会变得很无趣。我会分享一些我认为很有趣的或很好用的工具。这些工具简要分成了三类：`shell`、`package manager`、`cli tools`

## Shell

Windows 通常自带了 2 个 shell，分别是 *CMD* 和 *PowerShell*。当然 Windows 也可以使用别的 Shell，比如 *Bash*、*Zsh* 等，但需要额外下载。

目前有两种主流的方法，当然后者应该更主流一点

  - 通过 MSYS 下载移植的 Shell
  - 通过 WSL，在一个 Linux 子系统里使用别的 Shell

### zsh

wsl-zsh 系统包管理器可以直接下

msys-zsh 同上（系统包管理器是 pacman）


一些插件推荐

  - oh-my-zsh 插件框架。非常好用，建议先[安装此框架](https://github.com/ohmyzsh/ohmyzsh/?tab=readme-ov-file#basic-installation)再去安装下面的插件。
  - zsh-autosuggestions 自动建议。建议[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)。
  - zsh-syntax-highlight 语法高亮。建议[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)。
  - zsh-completions 额外的命令补全。一般来说没必要装，因为 zsh 自带的补全已经够用了。想装的话建议先去[仓库](https://github.com/zsh-users/zsh-completions/tree/master/src)里看看有没有需要的补全。

### bash

git-bash 安装 git 附赠的，不过这个 bash 其实来自于 msys 项目

msys-bash MSYS 环境默认的 shell

wsl-bash WSL 系统默认的 shell

一些插件或工具推荐

  - blesh 行编辑器。有语法高亮和自动建议等功能，但在 Windows 上（不管是 MSYS 还是 WSL）性能问题有点严重。想要这些功能建议用 zsh，安装 zsh-autosuggestions 和 zsh-syntax-highlight 两个插件即可（建议用 oh-my-zsh 管理插件）。
  - shellcheck 脚本静态检查。

### pwsh

如果喜欢用 powershell，那么 powershell 7 最好安装一个。这比自带的旧的 powershell 好用很多。

目前我感觉最主要的好处有以下几个

  - 更精确的错误提示
  - 常用的内置命令输出有高亮

另外 pwsh 也能安装插件（官方说法是模块），以下是推荐的部分模块

  - PSReadLine 改善使用体验的模块。有语法高亮、命令补全（似乎只支持内置命令）、自动建议等功能，体验上不如 zsh 的类似插件，但也算够用。
  - PSFzf 集成 fzf 的模块，需要先安装 fzf。
  - PSCompletions 命令补全模块，提供了常用命令的补全，并且可以管理这些补全。

## Package Manager

### windows
scoop

### linux
homebrew

## CLI Tools

### 必备

git

vim 也许 neovim 现在更流行，不过我不怎么用 vim 不太清楚

### 集成在 shell 里的

fzf

starship

zoxide

### 替代传统 gnu 工具的

eza 替代 ls

bat 替代 cat

delta 替代 diff

rg 替代 grep

tldr 替代 man

fd 替代 find

just 替代 make

### 小玩具

cloc 统计代码行数

fastfetch 获取系统信息，很酷，有种极客的感觉

gh GitHub 的 CLI 工具，没用过，感觉像玩具

graphviz 代码生成图片

pandoc 文档格式转换（好吧这个我偶尔会用，也许不是玩具）

### 语言解释器

<!-- TODO 这个不应该出现在这里，过段时间删了 -->

julia

nodejs

sbcl

scriptcs

iverilog + gtkwave 该软件有 dll 依赖，可能污染系统环境，建议在 MSYS 里用 pacman 装（不过说实话，随着安装的工具变多，MSYS 环境早晚会和系统环境冲突，要编译程序最好还是先进入 MSYS 环境，而不是在系统环境里编译）