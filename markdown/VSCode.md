# VSCode 配置手册

- [VSCode 配置手册](#vscode-配置手册)
  - [C/C++ 基础配置](#cc-基础配置)
    - [安装工具链](#安装工具链)
      - [安装编译器和调试器](#安装编译器和调试器)
      - [添加环境变量](#添加环境变量)
      - [安装编辑器插件](#安装编辑器插件)
    - [编辑器集成](#编辑器集成)
      - [配置智能感知](#配置智能感知)
      - [配置调试任务](#配置调试任务)
  - [Python 基础配置](#python-基础配置)
    - [安装工具链](#安装工具链-1)
      - [安装解释器和第三方库](#安装解释器和第三方库)
      - [安装编辑器插件](#安装编辑器插件-1)
    - [编辑器集成](#编辑器集成-1)
      - [使用解释器](#使用解释器)
      - [使用调试器](#使用调试器)
      - [使用编程笔记本](#使用编程笔记本)
  - [C/C++ 高级配置](#cc-高级配置)
    - [包管理器](#包管理器)
    - [构建工具](#构建工具)
    - [文档生成](#文档生成)
    - [内存分析](#内存分析)
    - [测试框架](#测试框架)
    - [开发框架](#开发框架)
    - [Clang 工具链](#clang-工具链)
    - [玩具](#玩具)
  - [Python 高级配置](#python-高级配置)
    - [性能分析](#性能分析)
    - [科学计算](#科学计算)
    - [绘图](#绘图)
    - [数据分析](#数据分析)
    - [信号与系统](#信号与系统)
    - [机器学习](#机器学习)
    - [编程笔记本](#编程笔记本)


## C/C++ 基础配置
[VSCode 官方文档](https://code.visualstudio.com/docs/cpp/config-mingw)

### 安装工具链
请确保已完成 [MSYS 的配置](MSYS.md)

#### 安装编译器和调试器

```sh
pacman -S mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-gdb
```

#### 添加环境变量

假设 MSYS2 安装在 ```C:\msys64``` 中

```bat
setx PATH "C:\msys64\ucrt64\bin;%PATH%"
```

测试是否成功
```sh
gcc --version
```

#### 安装编辑器插件
安装以下插件
- [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

### 编辑器集成

#### 配置智能感知
输入 VSCode 命令 ```C/C++: Edit Configurations```，调整需要的设置。

配置出来的 ```c_cpp_properties.json``` 文件大概长这样
```json
{
    "configurations": [
        {
            "name": "gcc",
            "includePath": [
                "${workspaceFolder}/**"
            ],
            "defines": [
                "_DEBUG",
                "UNICODE",
                "_UNICODE"
            ],
            "compilerPath": "C:/msys64/ucrt64/bin/g++.exe",
            "cStandard": "gnu23",
            "cppStandard": "gnu++23",
            "intelliSenseMode": "windows-gcc-x64"
        }
    ],
    "version": 4
}
```

现在代码可以智能感知了。

#### 配置调试任务
新建一个 ```test.c``` 或 ```test.cpp``` 文件

输入 VSCode 命令 ```C/C++: Add Debug Configuration```，选择 ```C/C++``` 插件自动生成的配置。

自动生成的 ```tasks.json``` 和 ```launch.json``` 文件大概分别长这样
```json
{
    "tasks": [
        {
            "type": "cppbuild",
            "label": "C/C++: g++.exe 生成活动文件",
            "command": "C:\\msys64\\ucrt64\\bin\\g++.exe",
            "args": [
                "-fdiagnostics-color=always",
                "-g",
                "${file}",
                "-o",
                "${fileDirname}\\${fileBasenameNoExtension}.exe"
            ],
            "options": {
                "cwd": "${fileDirname}"
            },
            "problemMatcher": [
                "$gcc"
            ],
            "group": "build",
            "detail": "调试器生成的任务。"
        }
    ],
    "version": "2.0.0"
}
```
```json
{
    "version": "2.0.0",
    "configurations": [
        {
            "name": "C/C++: g++.exe 构建和调试活动文件",
            "type": "cppdbg",
            "request": "launch",
            "program": "${fileDirname}\\${fileBasenameNoExtension}.exe",
            "args": [],
            "stopAtEntry": false,
            "cwd": "${fileDirname}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "gdb",
            "miDebuggerPath": "C:\\msys64\\ucrt64\\bin\\gdb.exe",
            "setupCommands": [
                {
                    "description": "为 gdb 启用整齐打印",
                    "text": "-enable-pretty-printing",
                    "ignoreFailures": true
                },
                {
                    "description": "将反汇编风格设置为 Intel",
                    "text": "-gdb-set disassembly-flavor intel",
                    "ignoreFailures": true
                }
            ],
            "preLaunchTask": "C/C++: g++.exe 生成活动文件"
        }
    ]
}
```

现在可以直接点击按钮来编译、运行和调试了。

## Python 基础配置
[VSCode 官方文档](https://code.visualstudio.com/docs/python/python-quick-start)

### 安装工具链
请确保已完成 [Conda 的配置](Conda.md)

#### 安装解释器和第三方库

```sh
# 选一个解释器的版本
mamba create -n ml python=3.13.5
# 选一些第三方库
mamba install ipykernel numpy matplotlib scikit-learn pandas
```

#### 安装编辑器插件
安装以下插件
- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Python Debugger](https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy)
- [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)

### 编辑器集成

#### 使用解释器
新建一个 ```test.py``` 文件

输入 VSCode 命令 ```Python: Select Interpreter```，选择一个合适的解释器。

现在可以直接点击按钮来运行了。

#### 使用调试器

输入 VSCode 命令 ```Debug: Add Configuration```，选择 ```Python Debugger``` 插件自动生成的配置。

自动生成的 ```launch.json``` 文件大概长这样

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python 调试程序: 当前文件",
            "type": "debugpy",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal"
        }
    ]
}
```

现在可以直接点击按钮来调试了。

#### 使用编程笔记本
新建一个 ```test.ipynb``` 文件

输入 VSCode 命令  ```Jupyter: Select Interpreter to Start Jupyter Server```，选择一个合适的内核。

现在可以使用编程笔记本了。

<!-- TODO C/C++ 高级配置 -->
## C/C++ 高级配置

### 包管理器
vcpkg

conan

### 构建工具
make

cmake

### 文档生成
doxygen

### 内存分析
drmemory --windows

valgrind --linux

### 测试框架
benchmark 基准测试框架

gtest 单元测试框架

### 开发框架
qt 图形界面框架

boost 标准库增强

### Clang 工具链
clang clang++ 新一代编译器

lldb 新一代调试器

clang-tidy 静态检查

clang-format 格式化

### 玩具
cling 解释器

xeus-cling 编程笔记本（Windows 无法使用）


<!-- TODO Python 高级配置 -->
## Python 高级配置

### 性能分析
snakeviz

### 科学计算
numpy

sympy

scipy

### 绘图
matplotlib

### 数据分析
networkx

pandas

### 信号与系统
control

### 机器学习
scikit-learn

tensorflow

pytorch

### 编程笔记本
ipykernel 内核

jupyterlab 界面

nbconvert 导出
