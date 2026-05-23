# TikZ

## 简介

TikZ 是 LaTeX 生态的一个软件包，可以通过代码绘制图片

## 对比

TikZ 能够绘制的图片类型远比 Mermaid/PlantUML 丰富

- Mermaid 只能绘制特定类型的图表
- TikZ 理论上能够绘制所有类型的图片

直接对标 TikZ 的是 SVG

- SVG 基于 Web，更适合集成到 Web 应用中。但直接手写 SVG 很麻烦，且缺少包管理，经常要重复造轮子
- TikZ 基于 LaTeX，有相当多的包，适合用于学术论文。同时也有一些项目（比如 TikZJax）尝试借助 WASM 在 Web 页面中实时渲染 TikZ

## 安装

### LaTeX

根据 LaTeX 发行版的不同，TikZ 的安装方式也不同。

对于大多数 LaTeX 发行版，比如 `MikTeX`/`Texlive`，TikZ 都是已安装的。如果未安装，则可使用包管理器

```sh
# Texlive
tlmgr install pgf
# MikTeX
miktex packages install pgf
```

### VSCode

VSCode 扩展 [TikZ in Markdown](https://marketplace.visualstudio.com/items?itemName=kevinyuan.vscode-tikzjax) 可以在 Markdown 预览时，渲染用代码块编写的 TikZ 图片，比如写成这样

````markdown
```tikz
\begin{tikzpicture}[x=1pt, y=1pt, font=\small]
  \draw[gray, thin, ->] (0,0) -- (0,200) node[above] {$A$};
  \draw[gray, thin, ->] (0,0) -- (300,0) node[right] {$f$};
  \node[gray] at (-10, -10) {0};

  \foreach \n in {1,...,5} {
    \node[gray] at (\n*50, -10) {$f_\n$};
    \draw[thick, black] (\n*50, 0) -- (\n*50, 180/\n^2) node[above] {$A_\n$};
  }
\end{tikzpicture}
```
````

## 使用

TikZ 通常是嵌入学术论文，并随着其一起编译的。

如果只想用 TikZ 做图片，那么可以添加如下代码让它变成独立的文档

```tex
\documentclass[tikz]{standalone}
\usepackage{tikz}
\begin{document}
\begin{tikzpicture}
% ...
\end{tikzpicture}
\end{document}
```

然后编译该 `tex` 文件

```sh
# 生成 dvi
latex tikz.tex
# 转为 svg
dvisvgm "tikz.dvi"
```
