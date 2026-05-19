# Jupyter

## 简介

Jupyter 是个交互式开发环境，由 **前端**、**后端**、**内核** 三部分组成。前端提供了可交互的界面，并能够进行渲染；后端负责处理前端的请求，并和内核通信；内核可以实际执行代码，并提供了特殊命令。

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

Jupyter 使用特殊的 **笔记本** 文件格式，可以将文档、代码等放在一起展示

- 文档是基于 *Markdown* 的，**渲染效果和前端有关**
- 代码支持使用不同的语言，需要 **安装对应的内核**

> [!Note]+ Jupyter 的发展历史
> 最早 Jupyter 叫做 `IPython Notebook`，只支持 `python`，这也就是为什么文件扩展名为 `.ipynb`。后来改进了架构，分离了后端和内核，可以支持更多的语言，比如 `Julia` 和 `R`，这便是新名字 `Ju(Julia)pyt(Python)er(R)` 的由来。而现在支持的语言越来越多，甚至连 `C++` 也能支持了（不过目前在 Windows 平台无法使用，且 **VSCode** 的 **C/C++** 扩展的 *intelliSense* 会失效）

Jupyter 的这种笔记本格式可以把代码、文本、图片、公式、图表作为一个复合文档统一展示。别人打开笔记本时可以看到你记录的完整分析过程、所有源代码和全部运行结果，也可以简单地重新运行部分代码看看是否能够复现。

当然了，这种笔记本格式也可以使用工具（比如 `nbconvert` 和 `pandoc`）导出为别的格式，包括但不限于 *HTML* 和 *PDF*，从而更方便分享。

### 远程开发

Jupyter 由于其前后端分离的架构设计，天然适合远程开发，这使得其在人工智能和科学计算领域非常流行。这些领域非常依赖机器性能，但没有人愿意抱着厚重机器到处跑。但有了 Jupyter，只需用轻薄本连上一个强大的远程服务器，就可以愉快地开发了。

### 交互式开发

Jupyter 还代表了一种新的编程方式，同时拥有 *REPL* 和 *直接运行整个文件* 的优点。代码是写在一个个块里的，你可以单独执行一个块的代码，也可以一次执行所有块的代码。甚至，配合一些工具，你还可以给块分组，然后单独执行某个组里的代码。比如对于机器学习任务，你可以只运行一小段数据处理代码，看看结果是否正确；然后运行一段可视化代码，看看整体的数据分布；接着尝试一些参数和模型，进行简单的训练；最后看看训练的效果，如有需要再回去调整。上述所有步骤都不需要从头开始重新执行文件，这种即时反馈极大地提升了探索和调试的效率。

Jupyter 还提供了一些魔法命令，有很多实用的功能，并且支持直接运行外部命令。这也使得 Jupyter 不仅仅是一个编辑器，而成为了一个集成开发环境。

## 安装

Jupyter 为了远程开发和多语言支持而设计了复杂的架构。因此，想要本地使用 Jupyter，不仅要有前端，还要有后端和内核。当然，如果你想进行远程开发的话，那么只需本地有前端就行，后端和内核都可以运行在别的机器上。

- 前端可以直接使用 **浏览器**，此时界面会取决于后端。或者也可以使用支持 Jupyter 的 **编辑器**，比如 `VSCode`（需要下载 [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter) 扩展）。
- 后端可以选择 `jupyterlab` 或 `notebook`，两者都可以通过 `pip` 安装，jupyterlab 可能更好一点。`VSCode` 的扩展实现了后端的主要功能，因此可以不额外安装后端。
- 内核有很多种，不同语言自然有不同的内核，一种语言也可能有多种内核。python 的内核一般用 `ipykernel`，通过 `pip install ipykernel` 就可以安装。你可以在 [这里](https://github.com/jupyter/jupyter/wiki/Jupyter-kernels) 找到目前能用的所有内核。

## 使用

> [!Note]+ 阅读文档
> 不同的前端之间使用方法可能差异很大，请阅读官方文档获得更详细的说明。

### VSCode

使用 VSCode 作为前端可以参考 [官方文档](https://code.visualstudio.com/docs/datascience/jupyter-notebooks)，里面有很详细的使用方法说明。

### Browser

如果你使用浏览器作为前端，那么你需要本地启动一个后端服务器。运行命令后会自动在浏览器中打开给定的 **URL**，你也可以手动输入。

```sh
# notebook
jupyter notebook
# jupyterlab
jupyter lab
```

### 导出

导出可以使用 `nbconvert`，通过 `pip install nbconvert` 安装。*VSCode* 的导出实际上就使用了 `nbconvert`

`nbconvert` 支持导出为多种格式，不过最常用的还是 *HTML* 和 $\LaTeX$。而 *PDF* 可由前者进一步处理得到。

#### HTML

```sh
# 将 example.ipynb 导出为 export.html
jupyter nbconvert example.ipynb --to html --output export
```

一些常用的选项

- `--template` 指定模板。内置的 *HTML* 模板只有 `basic`/`lab`/`classic`，可以自定义模板或下载社区里的模板。
- `--no-prompt` 不保留提示符
- `--clear-output` 清除输出

之后可以用浏览器的打印功能，将 `html` 文件转为 *PDF*。如果偏爱脚本也可以用 [无头浏览器](../网络工具/Chrome.md#无头模式) 来打印

> [!Warning]- HTML 的排版缺陷
>
> `lab` 模板的 HTML 在打印为 PDF 后，会截断非常长的代码行。
>
> 并且由于 HTML 不是专为排版设计的标记语言，因此很多时候排版效果并不好。如果比较在意排版，建议使用 LaTeX。

#### LaTeX

```sh
# 将 example.ipynb 导出为 export.tex
jupyter nbconvert example.ipynb --to latex --output export
```

如果原 `ipynb` 文件中有图片输出，则上述命令会创建一个文件夹 `export_files` 来保存图片。

$\LaTeX$ 内置的模板只有 `base`/`article`/`report`，可以自定义模板或下载社区里的模板。

> [!Tip]+ LaTeX 的中文配置和效果改善
>
> 由于 LaTeX 不像 HTML 天然支持中文，并且内置的模板不忠于 Jupyter 笔记本的实际渲染效果，因此建议下载社区的模板或自己修改模板。
>
> 我目前的做法是魔改 [nb_pdf_template](https://github.com/t-makaro/nb_pdf_template) 模板
>
> 1. 首先到 [share/templates/latex_authentic](https://github.com/t-makaro/nb_pdf_template/tree/master/share/templates/latex_authentic) 页面下载 [conf.json](https://github.com/t-makaro/nb_pdf_template/blob/master/share/templates/latex_authentic/conf.json) 和 [index.tex.j2](https://github.com/t-makaro/nb_pdf_template/blob/master/share/templates/latex_authentic/index.tex.j2) 这两个文件。
> 2. 然后把文件手动复制到对应环境的模板文件夹中。若 Python 环境是用 `miniforge` 安装的，则其具体位置为 `/path/to/miniforge/envs/<env_name>/share/jupyter/nbconvert/templates/<template_name>`，其中 `<template_name>` 为模板名，可以自己命名。
> 3. 最后修改 `index.tex.j2` 文件，将 `\documentclass[11pt]{article}` 改为 `\documentclass[11pt]{ctexart}`
> 4. 使用时通过 `--template <template_name>` 选择自定义的模板

之后就是编译 `tex` 文件得到 *PDF*，这要求本机已安装 $\TeX$ 环境

```sh
xelatex export.tex --quiet
```

> [!Warning]- LaTeX 的一些问题
>
> 原 `ipynb` 中引用的 *SVG* 文件似乎没有被嵌入编译后的 *PDF*。目前我的做法就是手动将 *SVG* 转为 *PNG*，而 `ipynb` 中只引用后者。

用 `nbconvert` 直接将 `ipynb` 转为 *PDF*，其实就是把转为 $\LaTeX$ 和编译 $\LaTeX$ 的步骤结合起来了。

### 导入

除了可以将 `ipynb` 导出为别的格式外，也可以把别的格式转换为 `ipynb` 文件。

最常用的工具就是 `notedown`，可以把 `md` 文件转为 `ipynb` 文件

```sh
# 将 input.md 转为 output.ipynb
notedown input.md > output.ipynb
```

> [!Tip]- Quarto
>
> `notedown` 的功能较为简单，我只使用它从一个模板 `md` 生成初始 `ipynb` 文件，后续就直接维护 `ipynb` 了。毕竟 `ipynb` 是 JSON 格式的文本文件，维护起来并不麻烦，没必要弄特别复杂的构建脚本；而将 `md` 作为源文件，将 `ipynb` 作为构建产物，则失去了 Jupyter 即时探索的流畅性。
>
> 但如果真的对相关做法感兴趣，可以了解一下 [Quarto](../文档工具/Quarto.md) 这个开源的科技出版系统。

### 命令行

Jupyter 的命令行工具除了可以启动后端服务器、进行导出外，还有别的功能。

比如 `jupyter kernelspec list` 可以列出当前能用的所有内核。

更多的用法可以通过 `jupyter --help` 来查看。
