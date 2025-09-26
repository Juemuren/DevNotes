# MSYS

## 对比

可以使用系统包管理器安装 C/C++ 包，方便小型项目的开发。

[MSYS2 对比其它项目](https://www.msys2.org/docs/what-is-msys2/)

## 安装

不建议用 scoop 安装。推荐使用官方的安装程序。

[MSYS2 官方下载链接](https://www.msys2.org/)

## 更改设置

### 修改 HOME

没找到官方文档，不过有 [Linux 手册](https://www.man7.org/linux/man-pages/man5/nsswitch.conf.5.html)可以勉强参考一下。

修改 MSYS2 的 ```/etc/nsswitch.conf``` 文件

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

假设 MSYS2 安装在 ```C:\msys64``` 中

### 使用脚本

```sh
# 获取帮助
C:\msys64\msys2_shell.cmd -help
# 基本的启动方式
C:\msys64\msys2_shell.cmd -defterm -no-start
# 在当前目录启动
C:\msys64\msys2_shell.cmd -defterm -no-start -here
# 保留 PATH
C:\msys64\msys2_shell.cmd -defterm -no-start -full-path
# 改为 UCRT64
C:\msys64\msys2_shell.cmd -defterm -no-start -ucrt64
# 使用 ZSH
C:\msys64\msys2_shell.cmd -defterm -no-start -shell zsh
# 全部结合起来
C:\msys64\msys2_shell.cmd -defterm -no-start -here -full-path -ucrt64 -shell zsh
```

可以看到启动命令很长，而且还要记脚本路径，用起来非常麻烦

虽然不建议用 scoop 安装，但 scoop 还有个好处是方便管理脚本

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
# 保留 PATH
C:\\msys64\\usr\\bin\\env MSYS2_PATH_TYPE=inherit /usr/bin/bash -li
# 改为 UCRT64
C:\\msys64\\usr\\bin\\env MSYSTEM=UCRT64 /usr/bin/bash -li
# 使用 ZSH
C:\\msys64\\usr\\bin\\env /usr/bin/zsh -li
# 全部结合起来
C:\\msys64\\usr\\bin\\env CHERE_INVOKING=1 MSYS2_PATH_TYPE=inherit MSYSTEM=UCRT64 /usr/bin/zsh -li
```

命令同样很长，也可以用 scoop 管理

## 配置终端

目前我们每次要进入 MSYS 环境时，都要先新建一个默认的 CMD/PowerShell 的终端，然后再输入命令。

这很麻烦。好在大多数编辑器/终端都可以配置启动命令。

启动命令可以参考[进入环境](#进入环境)这节

### VSCode Terminal
[MSYS2 官方文档](https://www.msys2.org/docs/ides-editors/)

[VSCode 官方文档](https://code.visualstudio.com/docs/terminal/profiles#_msys2)

vscode 有更方便的方式设置环境变量，这样命令就看起来不会很长，而且更易读。

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