# Pandoc

[官网](https://pandoc.org/)

## 简介

Pandoc 是一个文档格式转换工具，可以处理非常多种的文档格式转换。你可以在官网找到[所有支持的格式转换](https://pandoc.org/diagram.svgz)

## 安装

Windows 上我个人使用 Scoop 安装

```sh
scoop install pandoc
```

## 使用

Pandoc 的原理其实很简单，就是把输入文件先转成一个内部格式，然后再把内部格式转成另一个指定的格式。部分格式只能作为输入，部分格式只能作为输出，其余的都是可以双向转换的格式

你可以去官网找到更多使用示例，这里只介绍些我平时会用到的格式转换

### docx

docx 支持双向转换

```sh
# docx 转 markdown
pandoc example.docx -o example.md
# docx 转 pdf，得指定 pdf 引擎和中文字体，不然大概率会报错
pandoc example.docx -o example.pdf --pdf-engine=lualatex -V CJKmainfont="Microsoft YaHei UI"
```

样式不规范的 docx 文档转成别的格式后会可能会丢失部分关于样式的信息。目前我不知道有什么解决方法，也许只能督促那些用 *Microsoft Word* 的人正确地使用样式了

```sh
# markdown 转 docx
pandoc example.md -o example.docx
# 导出默认的 docx 模板
pandoc -o custom-reference.docx --print-default-data-file reference.docx
# 可以使用自己修改后的这个模板
pandoc example.md -o example.docx --reference-doc=custom-reference.docx
```

### markdown

markdown 也支持双向转换

不过由于 markdown 本身没有排版和样式的支持，因此如有相关需求需指定模板，这通常是 css、latex 或别的格式。你可以在 [Pandoc templates](https://pandoc-templates.org/) 上搜寻别人分享的模板。如果你不知道该用哪个模板，也许可以试试这个覆盖了几乎所有导出格式的[学术模板](https://github.com/maehr/academic-pandoc-template)。

#### 转 HTML

markdown 转 html 特别方便，速度也很快，毕竟大多数使用 markdown 的场景都和 html 有关。

通过指定 css 参数，可以自定义样式。

```sh
pandoc example.md -o example.html --css="github-markdown.css"
```

#### 转 PDF

markdown 转 pdf 略微麻烦，因为 markdown 是个没有排版功能的格式。

pandoc 通过将 markdown 转为另一种格式，再使用 pdf 引擎生成 pdf。因此 markdown 转 pdf 需要指定引擎。

引擎有很多种，会决定使用哪种中间格式；或者只指定中间格式，会使用该格式默认的引擎。中间格式我一般会选择 LaTeX、Typst 或 HTML 中的一个

- **LaTeX** 推荐使用 *lualatex* 引擎，对中文、数学公式的支持最好。不过 LaTeX 坑有点多，比如编译慢、安装环境很复杂，且使用时必须要指定模板，不然效果很差。
- **Typst** 引擎指定 *typst* 就行，默认的排版和样式就很不错，中文支持也是原生的，不需要额外指定字体。
- **HTML** 引擎默认为 *weasyprint*。最大的优势是样式很丰富 ~~css 太强大了~~，但排版效果不太好。我尝试了 pandoc 支持的所有 html 转 pdf 引擎，效果都不是很完美。如果要通过 **HTML** 转 **PDF**，建议先转为 **HTML**，再使用浏览器的打印功能生成 **PDF**。除了无法用脚本自动化以外，比其他的引擎效果都更好。

```sh
# markdown 通过 LaTeX 转 pdf，不仅要指定中文字体、pdf 引擎，还要指定模板
pandoc example.md -o example.pdf --pdf-engine=lualatex --template="eisvogel.latex" -V CJKmainfont="Microsoft YaHei UI"
# markdown 通过 Typst 转 pdf，不需要指定什么模板、样式，默认的效果就很好
pandoc example.md -o example.pdf --pdf-engine=typst
# markdown 通过 HTML 转 pdf，可以指定 css 样式
pandoc example.md -o example.pdf --pdf-engine=weasyprint --css="github-markdown.css"
```

#### 转 PPTX

```sh
# markdown 转 pptx
pandoc example.md -o example.pptx
```

markdown 转 **PPTX** 默认按照 *二级标题* 分页。因此，每个二级标题后的内容不应太长，否则会显示不下。不过其实用 *Microsoft PowerPoint* 的时候分页也是个很烦人的问题。

markdown 转 **PPTX** 也可以用样式美化，不过我没怎么研究。可以去看官方文档。

另一个工具 [Marp](Marp.md) 专门用来把 markdown 转为幻灯片，其中也包括了 **PPTX** 格式的幻灯片，有兴趣的话可以尝试一下。
