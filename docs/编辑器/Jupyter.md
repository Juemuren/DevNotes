# Jupyter
<!-- TODO 需要大改 -->
## 简介

Jupyter 是个交互式编程笔记本，功能非常强大。

Jupyter 由前端、后端和内核组成。前端是个基于**浏览器**的编辑器，提供编写代码、执行代码的界面；后端是**服务器**，负责处理前端的请求；内核是实际执行代码的地方，其对**解释器**进行了封装，以便可以和服务器通信。后端接收前端传来的代码，交给内核执行，然后再把运行结果传给前端，前端会对其进行渲染。

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

由于分离了后端和内核，因此代码可以支持不同种类的语言，只需安装对应的内核就行。不过由于历史原因，Jupyter 对 Python 的支持是最好的。

> [!Note] Jupyter 的发展历史
> 最早 Jupyter 叫做 `IPython Notebook`，只支持 `python`，这也就是为什么文件拓展名为 `.ipynb`。后来改进了架构，因此可以支持更多的语言，比如 `Julia` 和 `R`，这便是新名字 `Ju(Julia)pyt(Python)er(R)` 的由来。而现在支持的语言越来越多，甚至连 `C++` 也能支持了（不过目前在 Windows 平台无法使用，且 **VSCode** 的 **C/C++** 插件的 *intelliSense* 会失效）

### 远程开发

Jupyter 由于其前后端分离的架构设计，天然适合远程开发，这使得其在人工智能和科学计算领域非常流行。这些领域非常依赖机器性能，但没有人愿意抱着厚重机箱到处跑。但有了 Jupyter，只需用轻薄本连上一个强大的远程服务器，就可以愉快地开发了。

### 新的编程方式

Jupyter 还代表了一种新的编程方式，同时拥有了 *REPL* 和 *直接运行整个文件* 的优点。

Jupyter 编辑器是在一个个块里写代码的。你可以单独执行一个块的代码，结果就会显示在这个块的下面；你还可以一次执行所有块里的代码。甚至，配合一些工具，你还可以给块分组，然后执行某个组里的所有代码。

## 安装

Jupyter 为了远程开发和多语言支持而设计了复杂的架构。因此，想要本地使用 Jupyter，不仅要有前端，还要有后端和内核。当然，如果你想进行远程开发的话，那么只需本地有前端就行，后端和内核都可以运行在别的机器上。

前端可以直接使用浏览器，这样的话界面如何完全取决于后端。或者也可以使用支持 Jupyter 的编辑器，比如 `VSCode`，不过需要下载 [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) 插件。

后端有不少选择，比如 `jupyterlab` 或 `notebook`。两者都可以通过 `pip` 安装，jupyterlab 可能更好一点。`VSCode` 的插件实现了后端的主要功能，因此可以不额外安装后端。

内核同样有很多种，不同语言有不同内核，一种语言可能有多种内核。python 的内核一般为 `ipykernel`，通过 `pip install ipykernel` 就可以安装。你可以在[这里](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)找到目前能用的所有语言的所有内核

## 使用

> [!Note] 阅读文档
> 不同的前端之间使用方法可能差异很大，可以阅读官方文档获得更详细的说明。

使用 VSCode 作为前端可以参考[官方文档](https://code.visualstudio.com/docs/datascience/jupyter-notebooks)，里面有很详细的使用方法说明。

如果你使用浏览器作为前端，那么你需要本地启动一个后端服务器，然后在浏览器中输入给出 URL。

```sh
# jupyter notebook
jupyter notebook
# jupyterlab
jupyter lab
```

## 命令行

Jupyter 的命令行工具除了可以启动后端服务器外，还有别的功能。

比如 `jupyter kernelspec list` 可以列出当前能用的所有内核。

更多的用法可以通过 `jupyter --help` 来查看。
