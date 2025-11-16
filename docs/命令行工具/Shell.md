# Shell

## 简介

Shell，或者偶尔翻译为外壳，是一种 CLI 工具。

Shell 通常有两种使用方式。最常见的就是 *REPL* 模式，Shell 在终端里运行，读取输入、运行命令、打印结果、循环，这就是 `Read-Eval-Print-Loop` 的含义；另一种方式是像解释器一样直接运行单个脚本或命令，比如 `sh -c 'echo hello'` 让 Shell 执行 `echo hello` 单条命令，而 `sh test.sh` 则让 Shell 执行 `test.sh` 这个脚本

> [!Note]+ 系统相关
> Linux 系统通常都会自带 Bash，这是事实上的标准，因此其兼容性也是最好的。
>
> Windows 通常自带了 *2* 个 shell，分别是 *CMD* 和 *PowerShell*，不推荐日常使用前者。Windows 如果要使用别的 Shell，比如 *Bash*、*Zsh* 等，需要配置环境，比较麻烦。目前有两种主流的方法，当然后者应该更主流一点
>
> - 通过 [MSYS](../环境管理器/MSYS.md) 在一个模拟的 UNIX 环境中使用移植的 Shell
> - 通过 [WSL](../环境管理器/WSL.md) 在一个 Linux 子系统里使用 Shell

## Zsh

Zsh 可以通过系统包管理器安装。在 Ubuntu 上，一般是 `apt`，而 MSYS 的系统包管理器是 `pacman`

Zsh 可以安装插件，个人建议先安装 oh-my-zsh 再安装别的插件。oh-my-zsh 是个插件框架，可以很方便地管理插件，同时也自带了很多插件。安装方法可参考[官方文档](https://github.com/ohmyzsh/ohmyzsh/?tab=readme-ov-file#basic-installation)。

- zsh-autosuggestions 自动建议。oh-my-zsh 没有自带，可以用系统包管理器安装，也可以[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)。
- zsh-syntax-highlight 语法高亮。oh-my-zsh 同样没有自带，可以用系统包管理器安装，也可以[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)。
- zsh-completions 额外的命令补全。一般来说没必要装这个插件，因为 zsh 自带的补全已经够多了。想装的话建议先去[仓库](https://github.com/zsh-users/zsh-completions/tree/master/src)里看看有没有需要的补全。

## Bash

Bash 一般来说不需要自己去安装，不管 Linux、WSL 还是 MSYS，甚至在 Windows 上下载 Git for Windows，都会自带一个 Bash。

Bash 也可以安装插件，不过生态似乎没有 Zsh 好。我试了几个插件框架，但能管理的插件都很少。因此就不推荐插件框架了，只介绍一些好用的插件

- blesh 行编辑器，有语法高亮和自动建议等功能，非常强大。但在 Windows 上（不管是 MSYS、WSL 还是 git-bash）性能问题有点严重，建议用 Zsh 并安装 zsh-autosuggestions 和 zsh-syntax-highlight 这两个插件作为替代。

## Pwsh

如果喜欢用 powershell，那么 `powershell 7`，或者叫它 pwsh，最好还是安装一个。这比自带的旧的 powershell 好用很多。

目前我感觉最主要的好处有以下几个

- 更精确的错误提示
- 常用的内置命令输出有高亮

另外 pwsh 也能安装插件，不过官方的说法是模块。pwsh 自带了模块的管理框架，通过 `Install-Module PSCompletions` 命令就可以安装新的模块。以下是推荐的部分模块

- PSReadLine 改善使用体验的模块。有语法高亮、命令补全（只支持 `powershell` 内置命令）、自动建议等功能，体验上不如 Zsh 的类似插件，但也算够用。这个插件在 `powershell 7` 中似乎是预先安装了的。
- PSFzf 集成 fzf 的模块，需要先安装 fzf。
- PSCompletions 命令补全模块，提供了常用命令（包括 git、npm、scoop 等）的补全，并且可以管理这些补全。非常好用，缺点就是加载速度略慢。
- Pshazz 提供了很多功能，包括别名管理、prompt 美化、Git 补全、SSH 辅助等。这个脚本无法通过 `Install-Module` 获取，可以使用 `scoop install pshazz` 下载
