# 文档工具

## 基本概念

文档（在本文应该称为电子文档）是这个信息时代里每个人都会接触到的事物。对于开发者而言，有必要认识几种常见的文档格式，并了解一些有关文档的工具。

## 格式

### Markdown

Markdown 是一种标记语言，可理解为语法更简单的 **HTML**，因此算是 *HTMLite*。但同时大多数 Markdown 标准又支持内嵌 **HTML** 元素，因此 HTML 能做的 Markdown 都能做，算是个 *SuperHTML*。

我非常喜欢 Markdown 格式。虽然 Markdown 也有缺点，但我认为这就是最好的格式

  1. 优点
    - 极强的通用性。Markdown 直接以文本形式存储，可以在任何有文本编辑器的设备上修改和查看。
    - 版本控制友好。还是因为 Markdown 以文本形式存储，使得 git 的 diff/merge 等功能都可以正常使用。
    - 语法简单。Markdown 的语法非常接近纯文本，没有需要记忆的关键字。
    - 完美的源格式。Markdown 可以通过格式转换工具转换成 HTML、PDF、PPTX 等适合展示的格式，也可以通过静态网站生成器生成可部署的静态网站。Markdown 配合各种工具真正做到了**内容和样式的分离**，也真正做到了**一种形式编写多种形式展示**。
    - 应用广泛。Markdown 是软件工程里最主流的文档格式，同时 Github 的自述文件、LLM 的原始输出也基本都是 Markdown 格式。
  2. 缺点
    - 没有统一的标准。Github、Obsidian、Pandoc 等都有自己拓展的 Markdown 语法。如果过度依赖某个专有的特性，那么文档迁移会有点麻烦。
    - 排版和样式的功能欠缺。这导致 Markdown 转换为 PDF 会比较麻烦，通常要借助别的格式。

### LaTeX

LaTeX 是一个强大的写作排版系统，和 Markdown 一样直接以文本形式存储，但相比 Markdown 有一些显著的区别

- 语法更复杂。Markdown 使用直观简洁的符号，而 LaTeX 使用冗长的命令，学习曲线很陡峭
- 排版功能更好。Markdown 事实上并没有排版功能，而 LaTeX 则是排版领域的顶点
- 应用更局限。静态网站生成器、自述文件等对 Markdown 支持度很高，对 LaTeX 则几乎没有支持

LaTeX 最大的贡献也许就是完整定义了一套数学符号的语法。数学公式算是排版中最大的难题，而 LaTeX 则很好地解决了。这种语法在一些别的格式中也得到了支持，比如 Markdown。下面就是我用 Markdown 内嵌 TeX 写的 *麦克斯韦方程组微分形式*，而这被静态网站生成器转为 **HTML** 后由 `KaTeX` 进行了渲染

源代码

```tex
\begin{aligned}
\nabla \times \vec{\mathbf{B}} - \frac1c \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\
\nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}} + \frac1c \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0
\end{aligned}
```

渲染效果

$$
\begin{aligned}
\nabla \times \vec{\mathbf{B}} - \frac1c \frac{\partial\vec{\mathbf{E}}}{\partial t} & = \frac{4\pi}{c}\vec{\mathbf{j}} \\
\nabla \cdot \vec{\mathbf{E}} & = 4 \pi \rho \\
\nabla \times \vec{\mathbf{E}} + \frac1c \frac{\partial\vec{\mathbf{B}}}{\partial t} & = \vec{\mathbf{0}} \\
\nabla \cdot \vec{\mathbf{B}} & = 0
\end{aligned}
$$

LaTeX 有很多的发行版，比如 `Texlive` 和 `MikTeX`，我个人更喜欢后者。另外还有一个更现代的工具 `Tectonic`，它不安装完整的 TeX 系统，而是在编译时自动获取宏包并缓存到本地。

### Typst

Typst 类似 LaTeX，不过针对 LaTeX 的许多问题进行了改进。个人体验下来，相比 LaTeX 的主要优势为

- 编译速度更快。Typst 生成 PDF 的速度比 LaTeX 快非常多
- 语法更简单。Typst 语法比 LaTeX 更简洁和直观，学习曲线也更平缓。当然这一点两者都比不了 Markdown
- 中文支持更友好。LaTeX 编译中文文档会比较麻烦，而 Typst 则根本不需要额外设置，原生就支持 UTF-8 字符集

当然，Typst 也有一些缺点，这些缺点主要是因为 Typst 太年轻。LaTeX 有丰富的模板，无数的宏包，到处都是教程和指南，出版社、期刊等接受度也更高。不过我还是希望 Typst 能够成功，让写作排版多一个选择。

### DOCX

DOCX 是一种开放的文档格式，其本质是一个压缩包，解压后会看到 XML 等各种文件。

一般不直接修改 DOCX 的内部文件，而是使用专门的软件进行编辑，比如 **Microsoft Word** 或 **LibreOffice Writer**。Markdown、LaTeX 等也可以借助工具转为 DOCX。

尽管 DOCX 在普通用户中非常流行，但多数开发者都不喜欢这种格式。原因有很多，比如

- 不通用，兼容性差。由于 DOCX 将数据以特殊的二进制形式存储，导致文件必须使用特定的软件才能编辑和查看
- 版本控制不友好。这又是因为 DOCX 以二进制格式存储数据，导致 git 无法使用 diff/merge 等功能
- 没有强制的规范，容易写出低质量的文档。比如，对于样式的更改，很多人只是选中几个字然后手动调整，不懂得应该先创建一个新的样式，然后再将选中的文字改成自定义样式，这会让后续的修改、维护变得麻烦

### PDF

PDF 全称为 `可携带文档格式`。对排版有严格需求的场合（比如书籍出版、论文打印）通常都会使用 PDF 格式。

PDF 内部使用文本和二进制混合的格式，文本部分使用类似 PostScript 的语言定义文档结构，二进制部分主要是压缩后的资源数据和内容，整个文档是自包含和扁平化的。

虽然有软件可以直接编辑 PDF 文件，但一般不这么做，而是将别的更易编辑的格式转为 PDF 格式。DOCX、LaTeX、Typst 直接就可以将文档转为 PDF 格式，而 Markdown、HTML 等借助工具也可以做到。

### HTML

HTML 全称为 `超文本标记语言`。HTML 相比 PDF 更注重内容和样式而不是排版，因此不适合对排版有严格要求的场合。

HTML 使用类似 XML 的语法，并直接以文本形式存储。HTML 中可以嵌入或引用 CSS/JavaScript，浏览器可以渲染 HTML，也可以解析 CSS 和运行 JavaScript。因此  HTML 事实上不仅是文档，更是一个应用。

HTML 可以直接用文本编辑器编辑，也可以通过 Markdown 等格式转换而来。HTML 是 Web 应用的核心，有很多框架可以快速制作 Web 应用，可阅读 [Web 开发](../应用开发/Web.md)章节了解更多。

### PPTX

PPTX 将内容以幻灯片的方式进行展示，一般用于现场演示。

> [!Note]- PPT 和幻灯片
> 对于幻灯片（Slide），[维基百科](https://en.wikipedia.org/wiki/Presentation_slide)上的解释是
>
> > 幻灯片是演示文稿的单页。一组幻灯片称为幻灯片套件。幻灯片演示是在电子设备或投影屏幕上展示一系列幻灯片或图像。
>
> 因此虽然 PPT/PPTX 现在成为了幻灯片的同义词，但它始终只是一种能进行幻灯片演示的格式。
>
> 如果你只是需要以幻灯片的方式展示内容，那么你不一定要选择 PPTX。HTML 同样能进行幻灯片演示，而且效果并不差。

PPTX 和 DOCX 的实现类似，本质是个包含了 XML 等各种文件的压缩包。

PPTX 通常要使用别的软件进行编辑，比如 **Microsoft PowerPoint** 或 **LibreOffice Impress**。LaTeX 可以用 Beamer 制作 PPTX，Markdown 也能借助工具转成 PPTX。

## 工具

### 文档阅读

用于阅读文档的工具

- glow 终端 Markdown 渲染器，功能非常有限，但至少可以让阅读源代码更舒服一点
- SumatraPDF 开源的 PDF 阅读器，非常轻量和快速，没有臃肿的功能

### 格式转换

用来在不同文档格式之间进行转换的工具

- [Pandoc](Pandoc.md) 文档格式转换工具，非常强大，支持非常多的格式互相转换，包括 Markdown、LaTeX、Typst、DOCX、HTML、PDF、PPTX 等。
- [Marp](Marp.md) 一种专门将 Markdown 转换为幻灯片的工具
- markitdown 微软官方的做的一个把各种格式的文件转为 Markdown 的工具，甚至可以处理 YouTube 链接 ~~实际上只是把字幕文件转化为 Markdown 文件，不要以为能够一帧一帧地转换视频内容~~ 。在 LLM 盛行的当下非常适合炒作这个工具 `:)`，可以用它把所有东西都转成 Markdown 然后喂给 AI。

### 图表生成

可以用来生成表格/图片/视频的工具

- [Mermaid](Mermaid.md) 一个基于 JavaScript 的图表绘制工具，可以通过简单的代码绘制图表。类似的工具还有 `plantUML`，不过后者基于 Java，生态不如前者好
- Graphviz 代码生成图片的工具，`plantUML` 的底层就使用了这个工具
- QRencode 文本转二维码的命令行工具
- Manim 用来生成数学动画的 Python 库，最初是由 3blue1brown 制作的，现在更推荐使用社区维护的版本
- vhs 终端录像生成工具。和 `script`、`asciinema` 等工具不同，vhs 会根据你提供的要求，比如输入的命令、打字速度、画面大小等自动生成录像。这非常适合用来制作 CLI 应用的演示视频，毕竟自己手打命令的话，不小心操作失误可能就得重新录制。

### 可执行文档

让文档里能够嵌入可执行代码的工具。这些工具通常都会使用自定义的文件格式。

- [Jupyter](../编辑器/Jupyter.md) 交互式编程笔记本，功能非常强大。我把它放入了 *编辑器* 这一章节。
- [Quarto](Quarto.md) 基于 Pandoc 和 Jupyter 构建的开源科技出版系统。

### 代码文档生成器

能够根据源代码自动生成文档的工具。这些工具能够理解语言的接口定义，但通常还需要以约定好的注释格式提供额外的接口信息。

大多数编程语言都有官方的文档生成工具，通常这就是最好的。只有某些无官方实现的语言（点名 *C/C++*）才需要使用别的工具。

- [Doxygen](Doxygen.md) 可以导出 PDF、HTML 等格式，支持多种语言，但一般只用于 C/C++ 项目

### 静态网站生成器

静态网站生成器是一类很强大的工具。这些工具用 Markdown 或别的格式编写内容，根据配置文件中指定的主题、样式等信息生成可直接部署的静态网站。

- [MkDocs](MkDocs.md) 一个用 Python 写的静态网站生成器，本网站就是使用这个制作的
- VitePress 通过 Vite 和 Vue 驱动，样式很好看
- [Hugo](Hugo.md) 一个用 Go 实现的静态网站生成器，构建速度很快

### 综合处理

可以用来对一些格式进行各种操作的综合工具。因为功能比较多，不太好分类，所以放到了这里

- [PDFcpu](PDFcpu.md) 一个对 PDF 文档进行各种处理的命令行工具。类似的还有 `qpdf`、`xpdf`、`pdftk`、`GhostScript`。
- [ImageMagick](ImageMagick.md) 一个对图片进行各种处理的命令行工具。类似的还有 `chafa`。
