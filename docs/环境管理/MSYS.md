# MSYS

## 简介

MSYS 为 Windows 平台提供了一个模拟的环境，并移植了很多软件到这个模拟环境中，让开发者可以有到类 UNIX 系统的开发体验。

## 对比

[MSYS2 对比其它项目](https://www.msys2.org/docs/what-is-msys2/)

MSYS 全称为 Minimal SYStem，即最小系统，不过这和一般认知中的系统可能有点差别。MSYS 的所谓 *系统* 可分为 3 个部分

- 模拟环境。MSYS 的模拟环境这由运行时和核心工具组成。核心工具部分基于 Cygwin，运行时由 MSYS 项目自己维护。
- 移植软件。MSYS 移植软件的方式很直接。并不会修改软件的源代码，而是直接在这个模拟环境中进行编译和链接。
- 包管理器。MSYS 项目维护着一个仓库，并分发包含了预编译二进制文件的包。这些包可以通过包管理器 Pacman 获取。

### 包管理器

[与 Scoop 的对比](https://github.com/ScoopInstaller/Scoop/wiki/Cygwin-and-MSYS-Comparison)

由于 MSYS 有包管理器 Pacman，所以可能部分人用 MSYS 来安装在原生 Windows 环境里使用的软件。

虽然确实可以这么做，但由于是软件其实是在模拟里运行，因此会有一点性能损失。并且由于移植方式比较简单，部分工具使用起来会有点麻烦，比如 Git。而 Git for Windows 这个项目则专门针对 Windows 平台移植了 Git，实际体验会更好一点。

我目前的做法是

  1. 使用 MSYS 安装
    - 软件只发布源代码，且 Scoop 事实上也是直接从 MSYS 仓库里下载软件包的。这时使用 MSYS 可以省一点硬盘空间
    - Scoop 通过修改 *PATH* 而不是创建 *shim* 来提供可执行文件路径，且软件有 DLL 依赖。这时使用 Scoop 安装会污染系统环境。
  2. 使用 Scoop 安装
    - 软件有专门针对 Windows 做了移植的版本，或者有官方发布的 Windows 版本
    - 其余情况

所以基本上我只有特殊情况才会使用 MSYS 安装软件，而这些软件大多都来自 GNU 项目，或与之强相关。

### 开发环境

[与 WSL 的对比](https://www.msys2.org/docs/what-is-msys2/#msys2-vs-wsl)

由于 MSYS 可以轻松地获取 GCC/CLANG 编译工具，所以也有人用 MSYS 搭建 C/C++ 的开发环境

与自己手动安装 MinGW 相比，使用 MSYS 安装无疑是更好的。因为这样可以使用 Pacman 安装 C/C++ 包，这对于个人项目和小型项目的开发来说很方便。所以，如果希望在 Windows 系统上使用 GCC/CLANG 编译工具，那么 MSYS 肯定是最好的选择

而 WSL 是另一种在 Windows 上配置 C/C++ 开发环境的方式。但 WSL 要想编译出可以在原生 Windows 上运行的程序需要使用交叉编译，会比较麻烦，一般程序就只在 WSL 里运行。而 MSYS 可以轻松地编译出能在 Windows 上运行的程序。

## 安装

不建议用 scoop 安装。推荐使用官方的安装程序。

[MSYS2 官方下载链接](https://www.msys2.org/)

## 更改设置

### 修改 HOME

没找到官方文档，不过有 [Linux 手册](https://www.man7.org/linux/man-pages/man5/nsswitch.conf.5.html)可以勉强参考一下。

修改 MSYS2 的 `/etc/nsswitch.conf` 文件

```yaml
# 默认
db_home: cygwin desc
# 使用 windows 家目录
db_home: windows cygwin desc
```

### 安装 ZSH

```sh
pacman -S zsh
```

## 进入环境

[MSYS2 官方文档](https://www.msys2.org/wiki/Launchers/)

假设 MSYS2 安装在 `C:\msys64` 中

### 使用脚本

```sh
# 获取帮助
C:\msys64\msys2_shell.cmd -help
# 基本的启动方式
C:\msys64\msys2_shell.cmd -defterm -no-start
# 在当前目录启动
C:\msys64\msys2_shell.cmd -defterm -no-start -here
# 保留原来的 PATH
C:\msys64\msys2_shell.cmd -defterm -no-start -full-path
# 环境选择 UCRT64
C:\msys64\msys2_shell.cmd -defterm -no-start -ucrt64
# 使用 ZSH
C:\msys64\msys2_shell.cmd -defterm -no-start -shell zsh
# 全部结合起来
C:\msys64\msys2_shell.cmd -defterm -no-start -here -full-path -ucrt64 -shell zsh
```

可以看到启动命令很长，而且还要记脚本路径，用起来非常麻烦

虽然不建议用 Scoop 安装，但可以用它来管理脚本

```sh
# 用 scoop 方便地管理脚本
scoop shim add msys 'C:\msys64\msys2_shell.cmd' '--' -defterm -here -no-start -full-path -shell zsh
# 此后只需一个命令和一个参数就能启动对应的环境
msys -ucrt64
msys -mingw64
```

当然你也可以使用别的方式配置、管理你自己的脚本

现在我们可以随时随地非常方便地启动 MSYS 环境了

### 使用命令

当然也可以不使用官方的脚本，自己写命令。

```sh
# 基本的启动方式
C:\\msys64\\usr\\bin\\env /usr/bin/bash -li
# 在当前目录启动
C:\\msys64\\usr\\bin\\env CHERE_INVOKING=1 /usr/bin/bash -li
# 保留原来的 PATH
C:\\msys64\\usr\\bin\\env MSYS2_PATH_TYPE=inherit /usr/bin/bash -li
# 环境选择 UCRT64
C:\\msys64\\usr\\bin\\env MSYSTEM=UCRT64 /usr/bin/bash -li
# 使用 ZSH
C:\\msys64\\usr\\bin\\env /usr/bin/zsh -li
# 全部结合起来
C:\\msys64\\usr\\bin\\env CHERE_INVOKING=1 MSYS2_PATH_TYPE=inherit MSYSTEM=UCRT64 /usr/bin/zsh -li
```

命令同样很长，也可以用 Scoop 管理。

个人认为使用脚本可能更好，毕竟官方已经写好了脚本的启动命令，用就行了

## 配置终端

目前我们每次要进入 MSYS 环境时，都要先新建一个默认的 PowerShell 终端，然后再输入命令。

这很麻烦。好在大多数编辑器/终端都可以配置启动命令。

启动命令可以参考[进入环境](#进入环境)这节

### VSCode Terminal

[MSYS2 官方文档](https://www.msys2.org/docs/ides-editors/)

[VSCode 官方文档](https://code.visualstudio.com/docs/terminal/profiles#_msys2)

VSCode 有更方便的方式设置环境变量，这样命令就看起来不会很长，而且更易读。

```json
{
  "terminal.integrated.profiles.windows": {
    "MSYS UCRT": {
      "path": "C:\\msys64\\usr\\bin\\bash.exe",
      "args": ["--login", "-i"],
      "env": {
          "CHERE_INVOKING": "1",
          "MSYSTEM": "UCRT64",
          "MSYS2_PATH_TYPE": "inherit"
      },
      "overrideName": true,
      "icon": "terminal-bash",
      "color": "terminal.ansiWhite"
    }
  }
}
```

另外 *path* 填写 `bash.exe` 而不是 `msys2_shell.cmd`，可以让 VSCode 能够自动注入 Shell 集成脚本。但我不是很喜欢这个功能，这会让启动变慢，而且在 Windows 上只支持 PowerShell 和 Bash，使用 Zsh 就不能自动注入了，得手动注入。

### Windows Terminal

[MSYS2 官方文档](https://www.msys2.org/docs/terminals/#windows-terminal)

```json
{
  "profiles": {
    "list": [
      {
        "guid": "{17da3cac-b318-431e-8a3e-7fcdefe6d114}",
        "name": "MSYS2 UCRT",
        "commandline": "C:/msys64/msys2_shell.cmd -defterm -here -no-start -ucrt64",
        "startingDirectory": "C:/msys64/home/%USERNAME%",
        "icon": "C:/msys64/ucrt64.ico",
      }
    ]
  }
}
```
