# Cpp

## 环境搭建

推荐使用 MSYS + VSCode 搭建开发环境

### 安装工具链

请先完成 [MSYS 的安装](../环境管理/MSYS.md)

通过如下命令安装编译器和解释器

```sh
pacman -S mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-gdb
```

如此一来环境其实已经搭建完成了。你现在可以直接在终端里进入 MSYS 环境，然后编译文件、调试程序。

只不过，如果你想要使用 VSCode 的语言服务，那么需要配置智能感知。如果你想要 GUI 操作支持，那么需要配置调试任务。

### 编辑器集成

[VSCode 官方文档](https://code.visualstudio.com/docs/cpp/config-mingw)

需要安装以下插件

- [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

#### 添加环境变量

> [!WARNING]
> 修改 *PATH* 变量可能不是最好的做法。虽然这让我们能够不进入 MSYS 环境就使用编译器，但有潜在的环境的冲突的可能。最好还是[进入环境](../环境管理/MSYS.md)后再使用编译器。你可以[配置自定义任务](https://code.visualstudio.com/docs/debugtest/tasks#_custom-tasks)来使用 VSCode 的 GUI。

把编译器所在目录添加到系统 *PATH* 变量中

```bat
setx PATH "path\to\msys2\ucrt64\bin;%PATH%"
```

测试是否成功（在 VSCode 中打开集成终端，不进入 MSYS 环境）

```sh
gcc --version
```

#### 配置智能感知

输入 VSCode 命令 `C/C++: Edit Configurations`，调整需要的设置。会自动在 `.vscode/c_cpp_properties.json` 中生成配置文件，当然你也可以手动修改该文件

配置出来的 `c_cpp_properties.json` 文件大概长这样

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

现在代码可以使用语言服务了。

#### 配置调试任务

新建一个 `test.c` 或 `test.cpp` 文件，然后输入 VSCode 命令 `C/C++: Add Debug Configuration`，选择 `C/C++` 插件的默认配置模板。然后会在 `.vscode` 目录下自动生成配置文件。

自动生成的 `tasks.json` 和 `launch.json` 文件大概分别长这样

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

有关这些配置文件的更多信息，请参考

- [任务配置](https://code.visualstudio.com/docs/debugtest/tasks)
- [调试配置](https://code.visualstudio.com/docs/debugtest/debugging-configuration)

## 命令行工具

### 包管理器

包管理生态非常乱，没有官方标准，有各种第三方包管理器

系统包管理器也能管理 C/C++ 的包。不过现代项目不推荐使用系统包管理器，没法跨平台，难协作

- [Vcpkg](../包管理/Vcpkg.md)
- conan
- xrepo

### 构建系统

- make
- cmake
- xmake

### Clang 工具链

- clang clang++ 新一代编译器
- lldb 新一代调试器
- clang-tidy 静态检查
- clang-format 格式化

### 内存分析

- drmemory 只有 windows 可用
- valgrind 只有 linux 可用

### 玩具

- cling 解释器
- xeus-cling 编程笔记本（Windows 无法使用）

## 库和框架

### 通用库

- boost 标准库增强

### 测试框架

- benchmark 基准测试框架
- gtest 单元测试框架

### 图形界面框架

- qt 图形界面框架
