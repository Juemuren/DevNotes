# Jupyter

## 简介

Jupyter 是个交互式编程笔记本，功能非常强大。

Jupyter 分为前端和后端。前端是个基于**浏览器**的编辑器，提供编写代码、执行代码的界面；后端是**服务器**，负责处理前端的请求；最后还有个实际执行代码的内核，其对**解释器**进行了封装，以便可以和服务器通信。后端接收前端传来的代码，交给内核执行，然后再把运行结果传给前端，前端会对其进行渲染。

```mermaid
graph LR
    A[前端]
    B[后端]
    C[内核]
    A --请求--> B
    B --转发结果--> A
    B --转发请求--> C
    C --结果--> B
```

## 功能

### 写报告

Jupyter 可以用来在文档内嵌入代码及其执行结果。如果你有写科学计算相关报告的需求，那么 Jupyter 非常适合。

文档是基于 Markdown 的，因此可以通过工具（比如 `nbconvert` 和 `pandoc`）轻松转为多种格式，比如 html、pdf 等。

而代码也支持非常多的语言。早期该工具还叫做 `IPython Notebook`，只支持 `python`，这也就是为什么文件拓展名为 `.ipynb`。后来改进了架构，支持了更多的语言，比如 `Julia` 和 `R`，这便是新名字 `Ju(Julia)pyt(Python)er(R)` 的由来。而现在支持的语言越来越多，甚至连 `C++` 也能支持了（不过目前在 Windows 平台无法使用，且 **VSCode** 的 **C/C++** 插件的 *intelliSense* 会失效）

### 远程开发

Jupyter 由于其前后端分离的架构设计，天然适合远程开发，这使得其在人工智能和科学计算领域非常流行。这些领域非常依赖机器性能，但没有人愿意抱着厚重机箱到处跑。但有了 Jupyter，只需用轻薄本连上一个强大的远程服务器，就可以快速地进行开发了。

### 新的编程方式

Jupyter 还代表了一种新的编程方式，同时拥有了 *REPL* 和 *直接运行整个文件* 的优点。

Jupyter 编辑器是在一个个块里写代码的。你可以单独执行一个块的代码，结果就会显示在这个块的下面；你还可以一下执行所有的块的代码。甚至，配合一些工具，你还可以给块分组，然后只执行某个组的所有代码。

## 安装

Jupyter 为了支持多种语言，进行了前端、后端和内核的分离。因此，想要使用 Jupyter，不仅要安装前端，还要安装后端和内核，不过后端通常都会随着前端一起安装就是了。当然，如果你想进行远程开发的话，那么只需本地安装前端就行，后端和内核都可以运行在别的机器上。

内核有很多种，不同语言有不同内核，甚至一种语言也有不同的内核。比如 python 的内核一般为 `ipykernel`，通过 `pip install ipykernel` 就可以安装。你可以在[这里](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)找到目前能用的所有语言的所有内核

前端也有不少选择，比如 `jupyterlab` 或 `VSCode`。我个人更喜欢 VSCode，只需要下载 [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) 插件即可；而 jupyterlab 对一些冷门的内核支持更好。后者可以通过 `pip install jupyterlab` 安装。

## 使用

> [!Note]
> 不同的前端之间使用方法可能差异很大，可以阅读官方文档获得更详细的说明。

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
