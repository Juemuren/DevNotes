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

我[不喜欢 docx 格式](index.md#docx)。拿到 docx 文件后，我通常都会将其转为 markdown 或 pdf。docx 转 pdf 的工具很多，Microsoft Word 就自带这个功能，当然 Pandoc 也能干，但会麻烦一些；而 docx 转 markdown 的工具就比较少了，Pandoc 应该是最好用的

```sh
# docx 转 markdown
pandoc example.docx -o example.md
# docx 转 pdf，得指定 pdf 引擎和中文字体，不然大概率会报错
pandoc example.docx -o example.pdf --pdf-engine=lualatex -V CJKmainfont="Microsoft YaHei UI"
```

不过那些样式不规范的 docx 文档转换成 markdown 后会丢失很多关于样式的信息。目前我不知道有什么解决方法，也许只能督促那些用 Microsoft Word 的人更规范地使用样式了

当然了，docx 也是支持双向转换的，但我实在想不到将文件转换成 docx 格式有什么好处

### markdown

我认为 [markdown 是最完美的源格式](index.md#markdown)。自然地，markdown 也是可以双向转换的格式，但更常见的情况是将 markdown 转换为别的格式

不过，由于 markdown 本身没有排版和样式的支持，因此，如有相关需求，需要指定模板，通常是 css、latex 或别的格式。你可以在 [Pandoc templates](https://pandoc-templates.org/) 上搜寻别人分享的模板。如果你不知道该用哪个模板，也许可以试试这个覆盖了几乎所有的导出格式[学术模板](https://github.com/maehr/academic-pandoc-template)。

#### 转 HTML

markdown 转 html 特别方便，速度也很快，毕竟大多数使用 markdown 的场景都和 html 有关。

通过指定 css 参数，可以有更好看的样式。

```sh
pandoc example.md -o example.html --css="github-markdown.css"
```

#### 转 PDF

markdown 转 pdf 略微麻烦，因为 markdown 是个没有排版功能的格式。

pandoc 通过将 markdown 转为另一种格式，再使用 pdf 引擎生成 pdf。因此 markdown 转 pdf 需要指定引擎。

引擎有很多种，会决定使用哪种中间格式。中间格式一般就是 LaTeX、Typst 或 HTML

- LaTeX 推荐使用 *lualatex* 引擎，对中文、数学公式的支持最好。不过 LaTeX 坑有点多，比如编译慢、安装环境很复杂，且使用时必须要指定模板，不然效果很差。
- Typst 引擎指定 typst 就行，默认的排版和样式就很不错，中文支持也是原生的，不需要额外指定字体。
- HTML 引擎一般为 weasyprint。最大的优势是样式很丰富（毕竟 css 太强大了），但排版效果不太好。我尝试了 pandoc 支持所有的 html 转 pdf 引擎，效果都不是很完美。如果要通过 HTML 转 PDF，建议先转为 HTML，再使用浏览器的打印功能生成 pdf。除了不能够使用脚本自动化以外，比其他的引擎效果都更好。

```sh
# markdown 通过 LaTeX 转 pdf，不仅要指定中文字体、pdf 引擎，还要指定模板
pandoc example.md -o example.pdf --pdf-engine=lualatex --template="eisvogel.latex" -V CJKmainfont="Microsoft YaHei UI"
# markdown 通过 Typst 转 pdf，不需要指定什么模板、样式，默认的效果就很好
pandoc example.md -o example.pdf --pdf-engine=typst
# markdown 通过 HTML 转 pdf，一样可以使用 css 样式
pandoc example.md -o example.pdf --pdf-engine=weasyprint --css="github-markdown.css"
```

#### 转 PPTX

```sh
# markdown 转 pptx
pandoc example.md -o example.pptx
```

markdown 转 pptx 默认按照 *二级标题* 分页。因此，每个二级标题后的内容不应太长，否则会显示不下。不过其实用 Microsoft PowerPoint 的时候分页也是个很烦人的问题。

markdown 转 pptx 也可以用样式美化，不过我没怎么研究。可以去看官方文档。
