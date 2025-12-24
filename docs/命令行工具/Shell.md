# Shell

## 简介

Shell 是一个命令解释器，提供了与操作系统内核进行交互的环境，有时会被翻译为**外壳**以对应**内核**。

## 基本概念

### 使用模式

Shell 有不同的使用模式

- **REPL** 模式，或者叫交互式模式。比如终端创建时就会启动一个这样的 Shell，不断地读取输入、运行命令、打印结果、循环，这就是 **REPL** 全称 `Read-Eval-Print-Loop` 的含义
- **脚本** 模式，启动一个新的 Shell 进程执行给定的脚本/命令。比如 `sh -c 'echo hello'` 让 Shell 执行 `echo hello` 单条命令，而 `sh test.sh` 则让 Shell 执行 `test.sh` 这个脚本

### 环境变量

Shell 会使用操作系统的环境变量。环境变量有很多作用，比如充当系统的配置、表示当前会话的一个状态等

有一些环境变量非常重要，以 Bash 举例

- `PATH` 查找命令的目录列表
- `HOME` 家目录
- `PWD` 工作目录
- `PS1` 主提示符

Shell 临时创建新的环境变量，这在编写脚本中很有帮助。

### 查找命令

Shell 中命令查找通常遵循以下的优先级

1. 别名。Shell 可以添加命令别名，以便简写常用的命令
2. 关键字。Shell 通常会提供了一些便于编写脚本的关键字，比如 `if`/`while` 等
3. 函数。Shell 中通常可以定义函数，相比别名更适合简化复杂的命令
4. 内置命令。Shell 会有一些内置命令，通常包括 `cd`/`echo`/`pwd`/`type`
5. 外部命令。Shell 会在环境变量 `PATH` 中按目录顺序来寻找外部命令

### 工作目录

工作目录是 Shell 进程当前所在的目录路径，所谓的相对路径就是相对于工作目录的。

终端新建 Shell 时的初始工作目录一般都是家目录。大多数 Shell 都可以使用 `cd` 切换工作目录，使用 `pwd` 打印工作目录，并将工作目录的值存储在 `PWD` 环境变量中。

### 提示符

在 REPL 模式中，Shell 会在每个循环的开始打印提示符。这些提示符中可能包含当前的用户名、主机名、工作目录、权限级别等各种信息。

提示符可以高度自定义。有很多工具（比如 [starship](../命令行工具/Starship.md)）能够帮助我们快速配置出既美观又实用的提示符，或者也可以直接使用已有的主题。

## 替换 Shell

Shell 只是一个运行在用户空间的普通 CLI 程序，并不是操作系统内核的一部分。因此尽管系统安装时自带了 Shell，但这是可替换的。

### Linux

Linux 系统通常都会自带 Bash，这是事实上的标准。

Linux 使用其它 Shell 只需用系统包管理器安装然后修改登录 Shell 即可。以 Ubuntu + Zsh 为例，操作如下

```sh
# 安装 zsh
apt install zsh
# 修改登录 shell 为 zsh
chsh -s $(which zsh)
```

### Windows

Windows 系统通常自带了 *CMD* 和 *PowerShell*。日常使用推荐优先选择后者。

Windows 如果要使用别的 Shell，需配置环境，会比较麻烦。目前有两种主流的方法，当然后者应该更主流一点

- 通过 [MSYS](../环境管理器/MSYS.md) 在一个模拟的 UNIX 环境中使用移植的 Shell
- 通过 [WSL](../环境管理器/WSL.md) 在一个 Linux 子系统里使用 Shell

## 常用 Shell

### Zsh

Zsh 通常不会自带，需要手动用系统包管理器安装

Zsh 可以安装插件。`oh-my-zsh` 是个插件框架，可以很方便地管理插件，同时自带了很多插件。安装方法可参考[官方文档](https://github.com/ohmyzsh/ohmyzsh/?tab=readme-ov-file#basic-installation)。

- zsh-autosuggestions 自动建议。oh-my-zsh 没有自带，但可以[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)。
- zsh-syntax-highlight 语法高亮。oh-my-zsh 没有自带，但同样可以[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)。
- zsh-completions 额外的命令补全。一般来说没必要装这个插件，因为 zsh 自带的补全已经够多了。想装的话建议先去[仓库](https://github.com/zsh-users/zsh-completions/tree/master/src)里看看有没有需要的补全。

### Bash

Bash 一般来说都会自带。Linux、WSL 以及 MSYS 都将 Bash 作为默认，甚至下载 Git for Windows 都会自带一个 Bash。

Bash 也可以安装插件，不过生态似乎没有 Zsh 好。因此不推荐插件框架了，只介绍一些好用的插件

- blesh 行编辑器，有语法高亮和自动建议等功能，非常强大。但在 Windows 上（不管是 MSYS、WSL 还是 git-bash）性能问题有点严重，建议用 Zsh 并安装 zsh-autosuggestions 和 zsh-syntax-highlight 这两个插件作为替代。

### Pwsh

如果在 Windows 上喜欢用 PowerShell，那么 `PowerShell 7`（我喜欢叫它 Pwsh）最好还是安装一个。这比自带的旧的 PowerShell 好用很多。目前我感觉主要的好处有以下几个

- 更精确的错误提示
- 常用的内置命令输出有高亮

另外 Pwsh 也能安装插件，不过官方的说法是模块。Pwsh 自带了模块的管理框架，通过 `Install-Module PSReadLine` 命令就可以安装新的模块。以下是推荐的部分模块

- PSReadLine 改善使用体验的模块。有语法高亮、命令补全（只支持 `PowerShell` 内置命令）、自动建议等功能，体验上不如 Zsh 的类似插件，但也算够用。
- PSFzf 集成 fzf 的模块，需要先安装 [fzf](../数据处理工具/Fzf.md)。
- PSCompletions 命令补全模块，提供了常用命令（包括 git、npm、scoop 等）的补全，并且可以管理这些补全。
