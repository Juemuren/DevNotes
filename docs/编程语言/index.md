# 编程语言

一些我使用过的语言。不过其中大多都只是简单使用过，真正常用的只有 c/c++、python、js/ts

## 编译型

- [C/C++](Cpp.md) 三大编译器 *gcc*、*msvc*、*clang*。windows 推荐用 gcc，因为 clang 在 windows 上需要配合另外两者使用；而 msvc 我觉得安装太麻烦了，安装界面一堆选项给我看晕了，什么时候能一行命令安装完成我再考虑 msvc 吧。当然 C++ 也有个解释器 cling，不过这个纯玩具，没见人用过
- Cuda NVIDIA 发明的 C++ 方言，可以编译出能直接在 GPU 上运行的程序。可以使用 conda 搭建开发环境。创建并激活虚拟环境后 `mamba install nvidia::cuda-toolkit`。不过根据[官方文档](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html)，在 Windows 上可能必须得安装 Visual Studio，无法使用别的编译器。NVIDIA 似乎并没有支持 MinGW 的打算。
- C# 微软发明并推广的语言，只写过 hello world，没深入研究过。有个解释器 scriptcs，不过同样只是玩具
- Rust 简单使用过，包管理器很好用。用 rustup 安装编译器，这样可以管理不同的编译器版本
- Go 很适合写后端的语言，能够简单高效地处理并发问题，可作为大多数项目的首选。Docker、Kubernetes 等很多云原生基础设施都是 go 写的。另外不少 CLI 工具也是用 go 写的，比如 GitHub CLI 、Fzf。

## 解释型

- [Python](Python.md) 我用的是 miniforge 分发的 python
- [JavaScript](JavaScript.md) 后端服务器一般用 nodejs，不过浏览器的控制台里也可以写 js（chrome 内核的解释器是 v8）。可以用 nvm 安装解释器，以便管理不同的版本。
- julia 用 juliaup 安装解释器，可以管理不同的解释器版本
- lisp 解释器一般用 sbcl。这个语言应该已经没人写了，我是看《计算机程序的构造和解释》才知道的这个语言。用于教学应该挺不错的，不过 MIT 现在教那门课已经不用 lisp 了，改成了 python
- lua 一般没人专门用 lua 写项目。lua 因为解释器非常轻量而经常嵌入其它活动中。比如 neovim 的配置文件、xmake 的生成脚本（比 cmake 的 DSL 好写多了）、pandoc 的过滤器、部分游戏的脚本
