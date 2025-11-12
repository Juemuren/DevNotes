# Marp

## 简介

Marp 是一个专门用来把 Markdown 文档转为幻灯片的工具，支持 **PDF**、**HTML**、**PPTX** 等格式

## 对比

相比 pandoc，marp 更专注于幻灯片这种展示形式。即使能够导出为 PDF、HTML 等格式，仍然是幻灯片的样式、排版风格

因此针对该特定需求可能 marp 用起来更方便、效果更好

## 安装

```sh
# Windows
scoop install marp
```

## 使用

```sh
# HTML
marp example.md
# PPTX
marp example.md --pptx
# PDF
marp example.md --pdf
```

如果使用 VSCode 的话可以下个 [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode) 插件，可以显著提升编辑体验
