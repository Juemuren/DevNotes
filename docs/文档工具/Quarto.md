# Quarto

## 简介

Quarto 是个基于 Pandoc 和 Jupyter 构建的开源科技出版系统

简单地说，当要求渲染时，它会把文档中的代码交给 Jupyter 运行，然后把得到的结果嵌入在文档内；当要求导出时，它会用 pandoc 进行格式转换。这是一个站在巨人肩膀上的新工具。

## 对比

说实话我目前不太清楚这个相比 *Jupyter* 有哪些优势，排版更好也许是个优点吧

## 安装

不知道为什么 quarto 不在 Scoop 的 *main bucket* 里，想要安装的话得添加 *extra bucket*，或者自己去官网下载

```sh
scoop bucket add extras
scoop install quarto
```

Quarto 里捆绑了一个 pandoc，所以体积会相对大点

## 使用

不同的编辑器使用方法不太一样，建议参考[官方文档](https://quarto.org/docs/get-started/)

对于 VSCode，建议安装 [Quarto 插件](https://marketplace.visualstudio.com/items?itemName=quarto.quarto)，并在虚拟环境中安装 `jupyter matplotlib plotly`

如果只使用命令行的话，要先激活相应的环境，然后运行 `quarto preview hello.qmd`。这会启动本地开发服务器，并用浏览器进行渲染
