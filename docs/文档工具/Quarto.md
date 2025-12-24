# Quarto

## 简介

Quarto 是个基于 Pandoc 和 Jupyter 构建的开源科技出版系统

Quarto 自创了 qmd 这个 Markdown 拓展格式，并组合了 Pandoc 和 Jupyter。简单地说，当要求渲染时，它会把文档中的代码交给 Jupyter 运行，然后把得到的结果嵌入在文档内；当要求导出时，它会用 pandoc 进行格式转换。Quarto 就这样封装出了易用的接口，并实现了不错的出版效果。

## 对比

如果对排版没有什么要求，我觉得用 Jupyter 就够了。

## 安装

```sh
# Windows
scoop bucket add extras
scoop install quarto
```

Quarto 里捆绑了 `pandoc`/`typst`/`deno`/`dart` 等工具，所以体积会相对大点

## 使用

不同的编辑器使用方法不太一样，建议参考[官方文档](https://quarto.org/docs/get-started/)

对于 VSCode，建议安装 [Quarto 插件](https://marketplace.visualstudio.com/items?itemName=quarto.quarto)，并在虚拟环境中安装 `jupyter matplotlib plotly`

如果只使用命令行的话，要先激活相应的环境，然后再使用命令。
