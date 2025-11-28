# Jupyter

## 简介

Jupyter 是个交互式开发环境，由**前端**、**后端**和**内核**组成。前端提供了可交互的界面，并能够进行渲染；后端负责处理前端的请求，并和内核通信；内核可以实际执行代码，并提供了特殊命令。

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

### 编程笔记本

Jupyter 使用特殊的**笔记本**文件格式，可以将文档、代码等放在一起展示

- 文档是基于 *Markdown* 的，**渲染效果和前端有关**
- 代码支持使用不同的语言，需要**安装对应的内核**

> [!Note]+ Jupyter 的发展历史
> 最早 Jupyter 叫做 `IPython Notebook`，只支持 `python`，这也就是为什么文件拓展名为 `.ipynb`。后来改进了架构，分离了后端和内核，可以支持更多的语言，比如 `Julia` 和 `R`，这便是新名字 `Ju(Julia)pyt(Python)er(R)` 的由来。而现在支持的语言越来越多，甚至连 `C++` 也能支持了（不过目前在 Windows 平台无法使用，且 **VSCode** 的 **C/C++** 插件的 *intelliSense* 会失效）

Jupyter 的这种笔记本格式可以把代码、文本、图片、公式、图表作为一个复合文档统一展示。别人打开笔记本时可以看到你记录的完整分析过程、所有源代码和全部运行结果，也可以简单地重新运行部分代码看看是否能够复现。

当然了，这种笔记本格式也可以使用工具（比如 `nbconvert` 和 `pandoc`）导出为别的格式，包括但不限于 *HTML* 和 *PDF*，从而更方便分享。

### 远程开发

Jupyter 由于其前后端分离的架构设计，天然适合远程开发，这使得其在人工智能和科学计算领域非常流行。这些领域非常依赖机器性能，但没有人愿意抱着厚重机器到处跑。但有了 Jupyter，只需用轻薄本连上一个强大的远程服务器，就可以愉快地开发了。

### 交互式开发

Jupyter 还代表了一种新的编程方式，同时拥有 *REPL* 和 *直接运行整个文件* 的优点。代码是写在一个个块里的，你可以单独执行一个块的代码，也可以一次执行所有块的代码。甚至，配合一些工具，你还可以给块分组，然后单独执行某个组里的代码。比如你可以只运行一小段数据处理代码，看看数据长什么样；然后运行一段可视化代码，看看数据分布；接着再调整一下参数，重新训练模型。这一切都不需要从头开始重新执行文件，这种即时反馈极大地提升了探索和调试的效率。

Jupyter 还提供了一些魔法命令，有很多实用的功能，并且支持直接运行外部命令。这也使得 Jupyter 不仅仅是一个编辑器，而成为了一个集成开发环境。

## 安装

Jupyter 为了远程开发和多语言支持而设计了复杂的架构。因此，想要本地使用 Jupyter，不仅要有前端，还要有后端和内核。当然，如果你想进行远程开发的话，那么只需本地有前端就行，后端和内核都可以运行在别的机器上。

- 前端可以直接使用**浏览器**，此时界面会取决于后端。或者也可以使用支持 Jupyter 的**编辑器**，比如 `VSCode`，不过需要下载 [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) 插件。
- 后端可以选择 `jupyterlab` 或 `notebook`，两者都可以通过 `pip` 安装，jupyterlab 可能更好一点。`VSCode` 的插件实现了后端的主要功能，因此可以不额外安装后端。
- 内核有很多种，不同语言自然有不同的内核，一种语言也可能有多种内核。python 的内核一般用 `ipykernel`，通过 `pip install ipykernel` 就可以安装。你可以在[这里](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels)找到目前能用的所有语言的所有内核

## 使用

> [!Note]+ 阅读文档
> 不同的前端之间使用方法可能差异很大，可以阅读官方文档获得更详细的说明。

### VSCode

使用 VSCode 作为前端可以参考[官方文档](https://code.visualstudio.com/docs/datascience/jupyter-notebooks)，里面有很详细的使用方法说明。

### Browser

如果你使用浏览器作为前端，那么你需要本地启动一个后端服务器。运行命令后会自动在浏览器中打开给定的 **URL**，你也可以手动输入。

```sh
# jupyter notebook
jupyter notebook
# jupyterlab
jupyter lab
```

## 导出

导出可以使用 `nbconvert` 或 `pandoc`。更推荐使用前者，可以通过 `pip install nbconvert` 来安装。*VSCode* 的导出实际上就使用了 `nbconvert`

```sh
# 将 learn.ipynb 导出为 export.html
jupyter nbconvert learn.ipynb --to html --output export
```

`nbconvert` 支持导出为 *PDF* 和 *HTML*。不过对于 *PDF*，建议先导出为 *HTML*，再使用浏览器的 *打印* 功能。如果想直接转换为 *PDF*，不管是 `nbconvert` 还是 `pandoc` 都会尝试使用 $\LaTeX$ 进行编译，因此需要安装 $\TeX$ 环境；不仅如此，对于中文字体还需要额外的设置，比较麻烦。

## 命令行

Jupyter 的命令行工具除了可以启动后端服务器、进行导出外，还有别的功能。

比如 `jupyter kernelspec list` 可以列出当前能用的所有内核。

更多的用法可以通过 `jupyter --help` 来查看。
