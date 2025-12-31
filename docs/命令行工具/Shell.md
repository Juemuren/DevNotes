# Shell

## 简介

Shell 是一个命令解释器，提供了与操作系统内核进行交互的环境，有时会被翻译为**外壳**以对应**内核**。

## 基本概念

### 使用模式

Shell 有不同的使用模式

- **交互** 模式，或者叫 REPL 模式。比如终端创建时就会启动一个这样的 Shell，不断地读取输入、运行命令、打印结果、循环，这就是 **REPL** 全称 `Read-Eval-Print-Loop` 的含义
- **脚本** 模式，启动一个新的 Shell 进程执行给定的脚本/命令。比如 `sh -c 'echo hello'` 让 Shell 执行 `echo hello` 单条命令，而 `sh test.sh` 则让 Shell 执行 `test.sh` 这个脚本

### 变量和环境变量

Shell 中存在变量和环境变量。两者有点类似，主要的区别在于作用域

- 环境变量作用域更广，会自动传递给子进程
- 变量作用域更窄，只有当前 Shell 会话可用，不会自动传递给子进程

> [!Note]+ 常见变量/环境变量
> 有些变量或环境变量会被系统进程和多数程序拿去使用，因此成为了一种约定。这些变量用处广泛，以 Ubuntu 上的 Bash 为例
>
> - `PATH` 用于查找命令的目录列表
> - `HOME` 家目录
> - `PWD` 工作目录
> - `PS1`/`PS2` 主提示符/次提示符
> - `EDITOR` 默认编辑器
> - `LANG` 默认语言
> - `USER` 用户名
> - `HOST` 主机名
> - `HTTP_PROXY`/`HTTPS_PROXY` HTTP 代理/HTTPS 代理

Shell 通常会自动设置一些变量/环境变量，当然它们也可以被手动创建、修改、求值。大多数 Shell 关于变量/环境变量的语法都是一样的

- 使用 `$VAR` 获取变量/环境变量的值
- 使用 `VAR=xxx` 创建或者修改变量
- 使用 `export VAR=xxx` 创建或者修改环境变量

> [!Tip]+ 环境变量持久化
> 通过 `export VAR=xxx` 设置的环境变量只在当前 Shell 进程及子进程中有效。如果希望持久化设置，需要把命令添加到[配置文件](#配置文件)中。

可以使用 `env` 命令查看当前会话中所有的环境变量，而 `set` 命令可以查看所有的变量

> [!Note]- Pwsh 的环境变量
> Pwsh 中变量和环境变量的用法与 UNIX Shell 存在较大的区别
>
> - 对于变量用 `$VAR` 获取值，用 `$VAR=xxx` 创建或修改值
> - 对于环境变量用 `$Env:VAR` 获取值，用 `$Env:VAR=xxx` 创建或修改值

### 查找命令

Shell 中命令查找通常遵循以下的优先级

1. 别名。Shell 可以添加命令别名，以便简写常用的命令
2. 关键字。Shell 会存在一些关键字，比如 `if`/`while` 等
3. 函数。Shell 可以定义函数，比别名更适合应对复杂的命令
4. 内置命令。Shell 会有一些内置命令，通常包括 `cd`/`echo`/`pwd`/`type` 等
5. 外部命令。Shell 会在环境变量 `PATH` 中按目录顺序来寻找外部命令

### 工作目录

工作目录是 Shell 进程当前所在的目录路径，所谓的相对路径就是相对于工作目录的。

终端新建 Shell 时的初始工作目录一般都是家目录。大多数 Shell 都可以

- 使用 `cd` 切换工作目录
- 使用 `pwd` 打印工作目录
- 使用 `PWD` 环境变量获取工作目录

### 提示符

在 REPL 模式中，Shell 会在每个循环的开始打印提示符。这些提示符中可能包含当前的用户名、主机名、工作目录、权限级别等各种信息。

提示符可以高度自定义。有很多工具（比如 [starship](../命令行工具/Starship.md)）能够帮助我们快速定制出既美观又实用的提示符，也可以直接使用别人制作好的主题。

### 配置文件

Shell 通常都支持使用文件进行配置。不同 Shell 的配置文件可能不一样

- Bash 的配置文件为 `~/.bashrc`
- Zsh 的配置文件为 `~/.zshrc`
- Pwsh 的配置文件路径保存在环境变量 `$PROFILE` 中

提示符、别名、环境变量等都可以在配置文件中修改。不过一般不需要在配置文件中写特别复杂的脚本/命令，因为社区里总会有插件或类似的东西帮忙解决这些问题。

### 管道和重定向

多数 Shell 都支持管道。所谓管道就是把前一个命令的输出作为后一个命令的输入，语法通常都是 `command1 | command2`

多数 Shell 也都支持重定向。所谓重定向就是把命令的输出写入文件中，或者从文件中读取输入，语法通常都是

- `command > file` 将输出写入文件，会覆盖原有内容
- `command >> file` 将输出追加写入文件，不覆盖原有内容
- `command < file` 从文件中读取输入

> [!Note]- Pwsh 的重定向
> Pwsh 不支持使用 `<` 的重定向。通常可以使用管道 `cat file | command` 进行替代。

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

Zsh 通常不会自带，需要手动安装

```sh
# Arch/MSYS
pacman -S zsh
# Ubuntu
apt install zsh
```

Zsh 可以安装插件。`oh-my-zsh` 是个插件框架，可以很方便地管理插件，同时自带了很多插件。安装方法可参考[官方文档](https://github.com/ohmyzsh/ohmyzsh/?tab=readme-ov-file#basic-installation)。

以下是一些常用的但 `oh-my-zsh` 中没有的插件

- zsh-autosuggestions 自动建议。可以[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)。
- zsh-syntax-highlight 语法高亮。同样可以[使用 oh-my-zsh 安装](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)。
- zsh-completions 额外的命令补全。一般来说没必要装这个插件，因为 zsh 自带的补全已经够多了。建议先去[仓库](https://github.com/zsh-users/zsh-completions/tree/master/src)里看看有没有需要的补全。

### Bash

Bash 一般来说都会自带。Linux、WSL 以及 MSYS 都将 Bash 作为默认 Shell，甚至下载 Git for Windows 都会自带一个 Bash。

Bash 也可以安装插件，不过生态似乎没有 Zsh 好。因此不推荐插件框架了，只介绍一些好用的插件

- blesh 行编辑器，有语法高亮和自动建议等功能，非常强大。但在 Windows 上（不管是 MSYS、WSL 还是 git-bash）性能问题有点严重，建议用 Zsh 并安装 zsh-autosuggestions 和 zsh-syntax-highlight 这两个插件作为替代。

### Pwsh

如果在 Windows 上喜欢用 PowerShell，那么 `PowerShell 7`（我喜欢叫它 Pwsh）最好还是安装一个。这比自带的旧的 PowerShell 好用很多。

明显的好处有以下几个

- 更精确的错误提示
- 常用的内置命令输出有高亮

另外还有一些不太能感知到的好处

- 开源和社区驱动
- 架构改进，可跨平台
- 性能改善，增加了语法糖

Pwsh 也能安装插件，不过官方的说法是模块。Pwsh 自带了模块的管理框架，通过 `Install-Module PSReadLine` 命令就可以安装新的模块。以下是一些推荐的模块

- PSReadLine 改善使用体验的模块。有语法高亮、命令补全（只支持 `PowerShell` 内置命令）、自动建议等功能，体验上不如 Zsh 的类似插件，但也算够用。
- PSFzf 集成 fzf 的模块，需要先安装 [fzf](../数据处理工具/Fzf.md)。
- PSCompletions 命令补全模块，提供了常用命令（包括 git、npm、scoop 等）的补全，并且可以管理这些补全。
