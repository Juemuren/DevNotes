# 编程语言

大多数开发者一辈子只需要系统性地学习（包括完整的语法、主要的特性以及常用的标准库） **1-2** 门编程语言，其余的都只需要看看文档、简要了解一些独特之处后就可以上手写项目了。于我而言，我只系统地学习了 C、C++ 和 Python，但之后我还接触了 *10* 多种编程语言，包括 CUDA、C#、Go、GDScript、Java、Julia、Lisp、Lua、JavaScript/TypeScript、Ruby、Rust，以及我不想承认自己使用过的 MATLAB（因为教学原因使用过，但我非常讨厌不开源的语言）。

Julia 是我第一个通过查官方文档学会使用的语言，在此之前我以为学习编程应该借助书籍或者视频课程，但往往官方文档才是最好的资料。毕竟编程语言也是个高速发展的领域，书籍/课程从出版/发布的那一刻起就逐渐过时了，但官方文档总是随着语言一起更新。

有很多语言相关的知识是难以通过只看文档掌握的，比如相关生态（包括工具、库、框架等）、最佳实践、命名习惯、编码风格等。只有真正上手写了项目，才会慢慢学会这些东西。

每个开发者都会有自己的喜好，尤其是对带领自己进入编程领域的语言会有特殊的情愫。无论何时何地，讨论哪个语言更好都会引起争论。但语言事实上只是工具，我们用工具解决问题，而不是用工具异化自己。给自己打上 **xx 语言开发者** 的标签在我看来是个略显幼稚的行为。我很喜欢尝试不同的语言，这让我真实地感受到了它们之间的差异，也能够更加客观地评价它们各自的优劣。

## 编译型
<!-- TODO 每个语言后面跟着的一坨移到简介里，太长了 -->
- [C/C++](Cpp.md) 三大编译器 *gcc*、*msvc*、*clang*。windows 推荐用 gcc，因为 clang 在 windows 上需要配合另外两者使用；而 msvc 我觉得安装太麻烦了，安装界面一堆选项给我看晕了，什么时候能一行命令安装完成我再考虑 msvc 吧。当然 C++ 也有个解释器 cling，不过这个纯玩具，没见人用过
- CUDA NVIDIA 发明的 C++ 方言，可以编译出能直接在 GPU 上运行的程序。可以使用 conda 搭建开发环境。创建并激活虚拟环境后 `mamba install nvidia::cuda-toolkit`。不过根据[官方文档](https://docs.nvidia.com/cuda/cuda-installation-guide-microsoft-windows/index.html)，在 Windows 上可能必须得安装 Visual Studio，无法使用别的编译器。NVIDIA 似乎并没有支持 MinGW 的打算。
- C# 微软发明并推广的语言，只写过 hello world，没深入研究过。有个解释器 scriptcs，不过同样只是玩具
- Rust 简单使用过，包管理器很好用。用 rustup 安装编译器，这样可以管理不同的编译器版本
- Go 很适合写后端的语言，能够简单高效地处理并发问题，可作为大多数项目的首选。Docker、Kubernetes 等很多云原生基础设施都是 go 写的。另外不少 CLI 工具也是用 go 写的，比如 GitHub CLI 、Fzf。

## 解释型

- [Python](Python.md) 我用的是 miniforge 分发的 python
- [JavaScript/TypeScript](JavaScript.md) 后端服务器一般用 nodejs，不过浏览器的控制台里也可以写 js（chrome 内核的解释器是 v8）。TypeScript 为 JavaScript 制作了静态类型系统，可以通过编译进行类型擦除，从而得到干净的 JS 代码。
- julia 用 juliaup 安装解释器，可以管理不同的解释器版本
- lisp 解释器一般用 sbcl。这个语言应该已经没人写了，我是看《计算机程序的构造和解释》才知道的这个语言。用于教学应该挺不错的，不过 MIT 现在教那门课已经不用 lisp 了，改成了 python
- lua 一般没人专门用 lua 写项目。lua 因为解释器非常轻量而经常嵌入其它活动中。比如 neovim 的配置文件、xmake 的生成脚本（比 cmake 的 DSL 好写多了）、pandoc 的过滤器、部分游戏的脚本
