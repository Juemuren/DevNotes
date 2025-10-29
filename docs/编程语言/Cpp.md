# Cpp

## 环境搭建

C++ 有三大编译器 *GCC*、*MSVC*、*CLANG*。我个人更喜欢 GCC。CLANG 在 Windows 上需要配合另外两者使用；而 MSVC 我觉得太重了，即使只安装 *BuildTools* 也占用了很大的空间。

> [!Note] 解释器
> C++ 其实还有个解释器 Cling，不过这个纯玩具，没见人用过，所以不推荐拿来搭建环境，也许初学时可以用一用

我使用 MSYS + VSCode 搭建开发环境，该方案支持 GCC/CLANG 编译器，当然也可以使用别的方式搭建开发环境，比如 VSBuild + VSCode，这个方案使用 MSVC 编译器

### 安装工具链

#### MSYS

如果使用 MSYS 获取工具链，请先完成 [MSYS 的安装](../环境管理/MSYS.md#安装)，然后通过如下命令安装编译器和解释器

```sh
pacman -S mingw-w64-ucrt-x86_64-gcc mingw-w64-ucrt-x86_64-gdb
```

> [!Tip] MSYS 的 CLANG
> 如果想使用 CLANG 编译器，那么建议在 CLANG64 环境中获取工具链，这样全套工具链都是 CLANG 的
>
> ```sh
> pacman -S mingw-w64-clang-x86_64-clang mingw-w64-clang-x86_64-llvm mingw-w64-clang-x86_64-lldb
> ```
>
> 而如果在 UCRT64 环境中安装 CLANG，那么实际上还要依赖 GCC 的 C++ 库，不够 *纯*
>
> ```sh
> pacman -S mingw-w64-ucrt-x86_64-clang mingw-w64-ucrt-x86_64-lldb
> ```

如此一来环境其实已经搭建完成了。你现在可以直接在终端里进入 MSYS 环境，然后编译文件、调试程序。只不过，如果你想要使用 VSCode 的语言服务，那么需要配置智能感知。如果你想要 GUI 操作支持，那么需要配置调试任务。

> [!WARNING] 修改 PATH 变量
> 修改 *PATH* 变量可能不是最好的做法。虽然这让我们能够不进入 MSYS 环境就使用编译器，但有潜在的环境的冲突的可能。最好还是[进入编译环境](../环境管理/MSYS.md#进入环境)后再进行编译。不过这样使用 GUI 会比较麻烦，你可能需要参考[配置自定义任务指南](https://code.visualstudio.com/docs/debugtest/tasks#_custom-tasks)。
>
> 虽然说这可能不是最好的实际，但[官方文档](https://code.visualstudio.com/docs/cpp/config-mingw#_installing-the-mingww64-toolchain)就是这么干的，因为这会让后续的集成步骤更加简单。把编译器所在的目录，比如 `path\to\msys2\ucrt64\bin` 添加到系统 *PATH* 变量后，可以输入 `gcc --version` 测试是否成功。如果在 VSCode 的集成终端中找不到命令，你可能需要重启一下 VSCode，这样编辑器就会重新读取环境变量。

#### VSBuild

很多工具并不支持 MinGW 编译器，比如 CUDA 和 node-gyp，最主要的原因可能是 MSVC 和 GCC 的 ABI 不兼容，导致处理起来非常麻烦，为了省事就只支持 MSVC 了~~不过也许还有商业因素在里面~~。因此尽管我并不喜欢 MSVC，但有些时候确实不得不使用。

如果需要安装 VS 的话，建议只安装构建工具~~虽然安装体积还是很大~~。在[下载页面](https://visualstudio.microsoft.com/zh-hans/downloads/)找到 `Visual Studio 2022 生成工具`，安装工具时勾选 `使用 C++ 的桌面开发`。如果硬盘告急，则右侧可选项先只保留一个 `MSVC`，到时候缺什么再补什么就行。

VS 为了不污染 PATH，需要进入编译环境后才修改 PATH 以及别的环境变量。和 MSYS 一样，我不推荐去修改系统 PATH 变量，而是使用官方提供的脚本进入编译环境。这个脚本一般在 VS 安装目录的 `Common7\Tools\Launch-VsDevShell.ps1` 下。当然，除了使用脚本，官方还提供了快捷方式并且配置好了 `Windows Terminal`。不过我个人不太喜欢这些东西

可以使用 Scoop 让脚本更易用。命令大概是这样

```sh
# 创建脚本别名
scoop shim add vs 'path\to\vsbuild\Common7\Tools\Launch-VsDevShell.ps1'
# 或者添加一些默认的参数
scoop shim add vs 'path\to\vsbuild\Common7\Tools\Launch-VsDevShell.ps1' '--' -Arch amd64 -HostArch amd64
```

之后就可以使用 `vs` 来进入编译环境了。如果你没有在脚本中添加默认参数的话，启动时记得指定 `-Arch` 和 `-HostArch`，因为默认值是 *x86* 而非 *amd64*。你可以输入 `vs -?` 来查看有关这个脚本的更多信息。

> [!Tip] MSVC 与 CLANG
> 如果想使用 CLANG 编译器，那么首先应该确定已经安装了 MSVC 编译器，然后可以通过 `scoop install llvm` 获取 CLANG 编译器。编译时需确保处于正确的**编译环境**中

### 编辑器集成

> [!Note]- 官方文档
> 后面的教程以 **GCC** 为例，并且已经修改了系统的 *PATH*。MSVC 与 VSCode 集成的方法应该也差不多。虽然如此，还是建议参考官方文档。
>
> - [VSCode + GCC](https://code.visualstudio.com/docs/cpp/config-mingw)
> - [VSCode + MSVC](https://code.visualstudio.com/docs/cpp/config-msvc)

#### 配置智能感知

需要安装插件 [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

输入 VSCode 命令 `C/C++: Edit Configurations`，调整需要的设置。会自动在 `.vscode/c_cpp_properties.json` 中生成配置文件，当然你也可以手动修改该文件

配置出 `c_cpp_properties.json` 文件后，就可以使用语言服务了。

#### 配置调试任务

同样需要插件 [C/C++](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

新建一个 `test.c` 或 `test.cpp` 文件，然后输入 VSCode 命令 `C/C++: Add Debug Configuration`，选择 `C/C++` 插件的默认配置模板。然后会在 `.vscode` 目录下自动生成配置文件。

自动生成了 `tasks.json` 和 `launch.json` 文件后，就可以直接点击按钮来编译、运行和调试了。

当然，这些配置文件也可以自己手动更改。有关这些配置文件的更多信息，请参考

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
