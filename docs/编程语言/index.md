# 编程语言

一些我使用过的语言。不过其中大多都只是简单使用过，真正常用的只有 c、c++、python、js

## 编译型

  - c/c++ 三大编译器 gcc msvc clang。windows 推荐用 gcc，因为 clang 在 windows 上需要配合另外两者使用；而 msvc 我觉得安装太麻烦了，安装界面一堆选项给我看晕了，什么时候能一行命令安装完成我再考虑 msvc 吧
  - rust 简单使用过，包管理器很好用。用 rustup 安装编译器，这样可以管理不同的编译器版本

## 解释型

  - c++ 解释器 cling（玩具）
  - csharp 解释器 scriptcs（应该也是玩具）
  - python 我用的是 miniforge 版本的 python
  - js 后端服务器一般用 nodejs，不过浏览器的控制台里也可以写 js（chrome 内核的解释器是 v8）。可以用 nvm 安装解释器，以便管理不同的版本。
  - julia 用 juliaup 安装解释器，可以管理不同的解释器版本
  - lisp 解释器一般用 sbcl。这个语言应该已经没人写了，我是看《计算机程序的构造和解释》才知道的这个语言。用于教学应该挺不错的，不过 MIT 现在教那门课已经不用 lisp 了，改成了 python
  - lua 一般没人专门用 lua 写项目。lua 因为解释器非常轻量而经常嵌入其它活动中。比如 neovim 的配置文件、xmake 的生成脚本（比 cmake 的 DSL 好写多了）、pandoc 的过滤器、部分游戏的脚本
