# Jupyter

## 简介

Jupyter 是个交互式编程笔记本，功能非常强大。

Jupyter 分为前端和后端。前端是编辑器，通常基于浏览器，提供编写代码、执行代码的界面；后端是内核，对解释器进行了封装。内核会接收前端传来的代码，交给解释器执行，然后再把结果传回前端显示出来。

## 功能

### 写报告

Jupyter 可以用来在文档内嵌入代码及其执行结果。如果你有写科学计算相关报告的需求，那么 Jupyter 非常适合。

文档是基于 Markdown 的，因此可以通过工具（比如 `nbconvert` 和 `pandoc`）轻松转为多种格式，包括 html、pptx、pdf 等。

而代码也支持非常多的语言。早期该工具叫 `IPython Notebook`，只支持 `python`，这也就是为什么文件拓展名为 `.ipynb`。后来改进了架构，支持了更多的语言，比如 `Julia` 和 `R`，这便是新名字 `Ju(Julia)pyt(Python)er(R)` 的由来。而现在该工具不断发展，语言支持越来越丰富，甚至 `C++` 也能支持了（不过目前在 Windows 平台无法使用，且 **VSCode** 的 **C/C++** 插件的 *intelliSense* 会失效）

### 改善开发体验

Jupyter 还代表了一种新的、更便捷的开发方式，同时拥有了 *REPL* 和 *直接运行整个文件* 的优点。

Jupyter 编辑器是在一个个块里写代码的。你可以单独执行一个块的代码，结果就会显示在这个块的下面；你还可以一下执行所有的块的代码。甚至，配合一些工具，你还可以给块分组，然后只执行某个组的所有代码。

Jupyter 同时还支持远程开发。不过我没怎么用过远程开发，就不评价了。

## 安装

Jupyter 为了支持多种语言，进行了前后端的分离。因此，想要使用 Jupyter，不仅要安装前端，还要安装后端。当然，如果你想进行远程开发的话，那只需要本地安装前端就行了，后端可以运行在别的机器上。

后端有很多种，不同语言有不同内核，甚至一种语言也有不同的内核。比如 python 的内核一般为 `ipykernel`，通过 `pip install ipykernel` 就可以安装。你可以在[这里](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)找到目前能用的所有语言的所有内核

前端也有不少选择，比如 `jupyterlab` 或 `VSCode`。我个人更喜欢 VSCode，只需要下载 **Jupyter** 插件就行了；而 jupyterlab 是基于浏览器的界面，对一些冷门的内核支持更好。后者可以通过 `pip install jupyterlab` 安装。

## 使用

由于可选的前后端组合非常多，而不同前端使用方法可能差异很大，所以就不详细介绍这部分了。

使用 VSCode 作为前端可以参考 [ipykernel + vscode](../编程语言/Python.md#使用编程笔记本) 这段内容。

如果你使用的是别的前端，比如 `notebook` 或 `jupyterlab`，那么你可以在命令行运行

```sh
# jupyter notebook
jupyter notebook
# jupyterlab
jupyter lab
```

这会启动一个本地服务器。之后用浏览器访问给出的那个端口就可以了。

Jupyter 的命令行工具还有别的功能，比如 `jupyter kernelspec list` 可以列出当前能用的所有内核。更多的内容请自己探索。
