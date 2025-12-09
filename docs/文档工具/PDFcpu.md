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

这些工具的用法非常多，此处仅展示我自己用过的部分功能，更多细节请阅读对应的官方文档

### 使用 pdfcpu

[官方文档](https://pdfcpu.io/about/command_set)

导入/导出 PDF 书签

```sh
# 导出书签，文件默认为 out.json
pdfcpu bookmarks export example.pdf
# 导入书签，添加 -r 参数替换原有书签，并以新名字保存
pdfcpu bookmarks import -r example.pdf out.json example.new.pdf
```

### 使用 qpdf

[官方文档](https://qpdf.readthedocs.io/en/stable/cli.html#pdf-transformation)

去除 PDF 中的附件

```sh
# 列出附件
qpdf example.pdf --list-attachments
# 删除附件，并以新名字保存
qpdf example.pdf --remove-attachment=example_attachment.zip example.new.pdf
```
