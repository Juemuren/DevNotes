# VSCode

## 插件推荐

### 本地化

  - Chinese (Simplified) (简体中文) Language Pack for Visual Studio Code 中文本地化插件

### 实用

  - EditorConfig for VS Code 可以在不同的编辑器间使用相同的配置（包括缩进格式、编码方式、行尾序列等），如果参与协作通常都要这个东西。
  - Project Manager 为 VSCode 提供了一个项目管理面版
  - Todo Tree 识别代码中的所有 TODO、FIXME 等特殊注释，并在一个面板中显示出来
  - Bookmarks 代码书签，没怎么用过
  - Code Spell Checker 拼写检查，没怎么用过，因为代码里出现的英文单词一般都不是很规范，比如各种奇怪的缩写，还要一个个排除掉，有点麻烦
  - Vim 提供类似 Vim 的无鼠标编辑体验
  - WSL 支持连接到本地的 WSL 虚拟机
  - GitHub Repositories 远程浏览和编辑 GitHub 仓库，如果某些仓库特别大不适合 clone 到本地的话，这个插件非常方便

### 美化

美化就是生产力！

  - CodeSnap 生成好看的代码截图
  - Error Lens 把错误/警告/信息等直接显示在该行，而不是要打开面版才能查看
  - ident-rainbow 给缩进高亮，让你能够清楚地看出缩进层数
  - Material Icon Theme 美化插件，好看的图标。
  - One Dark Pro 我很喜欢的一个主题。
  - Output Colorizer 为 VSCode 的输出面板着色

### 版本管理

我主要还是用 VSCode 自带的 Git 拓展，结合命令行操作，比较少用插件

  - Git Graph 增强 Git，以图形的方式显示 git 历史，并支持丰富的操作。
  - Gitlens 会把 git 历史信息直接显示在该行，另外还有其它功能，有点臃肿。

### 文件支持

  - Office Viewer 支持在 VSCode 里查看非常多种的格式，包括 docx、xlsx、pdf、ttf、zip 等
  - Mermaid Chart 支持 mermaid 预览和导出
  - PlantUML 和前者差不多，不过是另一种语法的 UML
  - YAML 语言服务
  - Even Better TOML 格式了 TOML 的语言服务

### 编程笔记本

  - Jupyter
  - Polyglot Notebooks

## Cpp

[VSCode 官方文档](https://code.visualstudio.com/docs/cpp/config-mingw)

### 环境搭建

请确保已完成 [MSYS 的配置](../环境管理/MSYS.md)

#### 安装工具链

```sh
pacman -S mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-gdb
```

如此一来环境其实已经搭建完成了。你现在可以直接在终端里进入 MSYS 环境，然后编译文件、调试程序。

只不过，如果你想要使用 VSCode 的语言服务，那么需要配置智能感知。如果你想要 GUI 操作支持，那么需要配置调试任务。

#### 添加环境变量

> [!WARNING]
> 修改 *PATH* 变量可能不是最好的做法。虽然这让我们能够不进入 MSYS 环境就使用编译器，但有潜在的环境的冲突的可能。最好还是[进入环境](../环境管理/MSYS.md)后再使用编译器。你可以[配置自定义任务](https://code.visualstudio.com/docs/debugtest/tasks#_custom-tasks)来使用 VSCode 的 GUI。

假设 MSYS2 安装在 `C:\msys64` 中

```bat
setx PATH "C:\msys64\ucrt64\bin;%PATH%"
```

测试是否成功（在 VSCode 中打开集成终端，不进入 MSYS 环境）

```sh
gcc --version
```

### 编辑器集成

需要安装以下插件

  - [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

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

## Python

[VSCode 官方文档](https://code.visualstudio.com/docs/python/python-quick-start)

### 安装工具链

请确保已完成 [Conda 的配置](../环境管理/Conda.md)

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

新建一个 `test.py` 文件

输入 VSCode 命令 `Python: Select Interpreter`，选择一个合适的解释器。

现在可以直接点击按钮来运行了。

#### 使用调试器

输入 VSCode 命令 `Debug: Add Configuration`，选择 `Python Debugger` 插件自动生成的配置。

自动生成的 `launch.json` 文件大概长这样

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

新建一个 `test.ipynb` 文件

输入 VSCode 命令  `Jupyter: Select Interpreter to Start Jupyter Server`，选择一个合适的内核。

现在可以使用编程笔记本了。

有关 Python 开发的更多技巧可以参考 [Python](../编程语言/Python.md)
