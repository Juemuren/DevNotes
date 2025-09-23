# PDFcpu

## 简介

PDFcpu 是一个用 Go 编写的 PDF 处理器

## 对比

类似的工具有很多，比如 `qpdf`、`xpdf`、`pdftk`、`GhostScript` 等

## 安装

```sh
scoop install pdfcpu
scoop install qpdf
```

## 使用

我只用过 pdfcpu 和 qpdf，而且是为了一些非常小的事情而简单尝试了一下。

我更习惯在有图形界面的编辑器里修改 PDF 文档，只有当免费的工具满足不了需求时我才会寻求这些命令行工具。

### 使用 pdfcpu

[官方文档](https://pdfcpu.io/about/command_set)

### 使用 qpdf

[官方文档](https://qpdf.readthedocs.io/en/stable/cli.html#pdf-transformation)

我用 qpdf 是为了去除某些 PDF 文件中的附件，而 pdfcpu 对此处理出错了

```sh
# 列出附件
qpdf example.pdf --list-attachments
# 删除附件，并以一个新名字保存
qpdf example.pdf  --remove-attachment=example_attachment.zip  example.new.pdf
```
