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

```sh
# markdown 转 html，指定了 css 就可以有自定义的样式了
pandoc example.md -o example.html --css="github-markdown.css"
# markdown 转 pdf，不仅要指定中文字体、pdf 引擎，还要指定模板
pandoc example.md -o example.pdf --template="eisvogel.latex" --pdf-engine=lualatex -V CJKmainfont="Microsoft YaHei UI"
# markdown 转 pptx
pandoc example.md -o example.pptx
```

markdown 转 pptx 默认按照 *二级标题* 分页。因此，每个二级标题后的内容不应太长，否则会显示不下。不过其实用 Microsoft PowerPoint 的时候分页也是个很烦人的问题。

另外，markdown 不仅可以通过 LaTeX 转成 PDF，还可以通过 HTML 转成 PDF。虽然后者样式更丰富（毕竟 css 太强大了），但排版效果不太好，你可以自行取舍。如果需要从 HTML 转 PDF，你可能需要安装额外的工具，比如 weasyprint；或者可以使用浏览器的打印功能，但这样就不能够使用脚本自动化
