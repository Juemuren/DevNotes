# Pandoc

## 简介

Pandoc 是一个文档格式转换工具，可以处理非常多种的文档格式转换。你可以在[官网](https://pandoc.org/)找到[所有支持的格式转换](https://pandoc.org/diagram.svgz)

## 安装

```sh
# Windows
scoop install pandoc
```

## 使用

Pandoc 的原理其实很简单，就是把输入文件先转成一个内部格式，然后再把内部格式转成另一个指定的格式。部分格式只能作为输入，部分格式只能作为输出，其余的都是可以双向转换的格式

你可以去官网找到更多使用示例，这里只介绍些我平时会用到的格式转换

### docx

docx 支持双向转换

docx 可以转换成别的格式，比如 markdown，不过可能会丢失部分关于样式的信息。docx 也可以转为 pdf，但更建议使用 **Microsoft Word** 完成这个转换，pandoc 使用第三方 pdf 引擎，可能会有排版上的差异。

```sh
# docx 转 markdown
pandoc example.docx -o example.md
```

别的格式也可以转为 docx，并且支持自定义模板

```sh
# markdown 转 docx
pandoc example.md -o example.docx
# 导出默认的 docx 模板
pandoc -o custom-reference.docx --print-default-data-file reference.docx
# 使用修改后的模板
pandoc example.md -o example.docx --reference-doc=custom-reference.docx
```

### markdown

markdown 也支持双向转换

markdown 本身没有排版和样式的功能，导出为其他格式时需指定模板。Pandoc 默认的模板效果比较一般。你可以在 [Pandoc templates](https://pandoc-templates.org/) 上搜寻别人分享的模板。如果你不知道该用哪个模板，也许可以试试这个覆盖了几乎所有导出格式的[学术模板](https://github.com/maehr/academic-pandoc-template)。

#### markdown 转 HTML

markdown 转 **HTML** 特别方便，速度也很快，毕竟大多数使用 markdown 的场景都和 html 有关。

通过 css 参数可以自定义样式。

```sh
# markdown 转 html
pandoc example.md -o example.html --css="github-markdown.css"
```

#### markdown 转 PDF

markdown 转 **PDF** 有点麻烦，因为 markdown 是个没有排版功能的格式。

事实上，无论源格式是什么，pandoc 都会将文档转为中间格式，然后再借助 pdf 引擎完成转换。因此关于 pdf 的转换放到了[单独的部分](#pdf)。

#### markdown 转 PPTX

markdown 转 **PPTX** 默认按照 *二级标题* 分页。因此，每个二级标题后的内容不应太长，否则会显示不下。不过其实用 **Microsoft PowerPoint** 的时候分页也是个很烦人的问题。

```sh
# markdown 转 pptx
pandoc example.md -o example.pptx
```

另一个工具 [Marp](Marp.md) 专门用来把 markdown 转为幻灯片，其中也包括了 **PPTX** 格式的幻灯片。在这个特定功能上可能 Marp 更好用一点。

### pdf

pandoc 通过将文档转为另一种格式，再使用 pdf 引擎生成 pdf。引擎有很多种，[官方文档](https://pandoc.org/MANUAL.html#option--pdf-engine)里有详细的列表。引擎会决定使用哪种中间格式；或者也可以只指定中间格式，然后使用该格式的默认引擎。

中间格式我一般会选择 LaTeX、Typst 或 HTML 中的一个

- **LaTeX** 推荐使用 *lualatex* 引擎，对中文、数学公式的支持最好。不过 LaTeX 坑有点多，比如编译慢、安装环境很复杂，且使用时必须要指定模板，不然效果很差。
- **Typst** 引擎指定 *typst* 就行，默认的排版和样式就很不错。
- **HTML** 引擎默认为 *weasyprint*。最大的优势是样式很丰富 ~~css 太强大了~~，但排版效果不太好。如果要通过 **HTML** 转 **PDF**，建议先转为 **HTML**，再使用浏览器的打印功能生成 **PDF**。除了无法用脚本自动化以外，比其它的引擎效果都更好。

```sh
# markdown 通过 LaTeX 转 pdf
pandoc -s example.md -o example.pdf --pdf-engine=lualatex --template="eisvogel.latex" -V CJKmainfont="Microsoft YaHei UI"
# markdown 通过 Typst 转 pdf
pandoc -s example.md -o example.pdf --pdf-engine=typst -V mainfont="Microsoft YaHei UI"
# markdown 通过 HTML 转 pdf
pandoc -s example.md -o example.pdf --pdf-engine=weasyprint --css="github-markdown.css"
```

部分参数说明

- `-V` 参数向 pandoc 传递了模板变量.模板变量也可以通过 `front-matter` 传递。你可以在[官方文档](https://pandoc.org/MANUAL.html#variables)里找到更多的可使用变量。
- `-s` 参数生成带有页眉、页脚的输出。对于 pdf 格式这个参数会自动设置，因此可省略。
- `--template` 用于指定模板，和 `--css` 一样，一般是文件的相对路径。

你可以在[官方文档](https://pandoc.org/MANUAL.html#templates)里找到关于使用模板的更详细说明。
