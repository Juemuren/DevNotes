# Shell

Windows 通常自带了 *2* 个 shell，分别是 *CMD* 和 *PowerShell*。当然 Windows 也可以使用别的 shell，比如 *bash*、*zsh* 等，但需要额外下载。目前有两种主流的方法，当然后者应该更主流一点

  - 通过 MSYS 使用移植的 Shell
  - 通过 WSL，在一个 Linux 子系统里使用别的 Shell

## zsh

wsl-zsh 系统包管理器可以直接下

msys-zsh 同上（系统包管理器是 pacman）

一些插件推荐

  - oh-my-zsh 插件框架。非常好用，建议先[安装此框架](https://github.com/ohmyzsh/ohmyzsh/?tab=readme-ov-file#basic-installation)再去安装下面的插件。
  - zsh-autosuggestions 自动建议。建议[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)。
  - zsh-syntax-highlight 语法高亮。建议[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)。
  - zsh-completions 额外的命令补全。一般来说没必要装，因为 zsh 自带的补全已经够用了。想装的话建议先去[仓库](https://github.com/zsh-users/zsh-completions/tree/master/src)里看看有没有需要的补全。

## bash

git-bash 安装 git 附赠的，不过这个 bash 其实来自于 msys 项目

msys-bash MSYS 环境默认的 shell

wsl-bash WSL 系统默认的 shell

一个用过的插件介绍

  - blesh 行编辑器。有语法高亮和自动建议等功能，但在 Windows 上（不管是 MSYS 还是 WSL）性能问题有点严重。想要这些功能建议用 zsh，安装 zsh-autosuggestions 和 zsh-syntax-highlight 两个插件即可（建议用 oh-my-zsh 管理插件）。

## pwsh

如果喜欢用 powershell，那么 `powershell 7` 最好安装一个。这比自带的旧的 powershell 好用很多。

目前我感觉最主要的好处有以下几个

  - 更精确的错误提示
  - 常用的内置命令输出有高亮

另外 pwsh 也能安装插件（官方说法是模块），以下是推荐的部分模块

  - PSReadLine 改善使用体验的模块。有语法高亮、命令补全（似乎只支持内置命令）、自动建议等功能，体验上不如 zsh 的类似插件，但也算够用。
  - PSFzf 集成 fzf 的模块，需要先安装 fzf。
  - PSCompletions 命令补全模块，提供了常用命令的补全，并且可以管理这些补全。