# 文档工具

## 基本概念

文档（在本文应该称为电子文档）是这个信息时代里每个人都会接触到的事物。对于开发者而言，有必要认识几种常见的文档格式，并了解一些有关文档的工具。

除了传统意义上的文档外，图片、音视频等广义上的文档也放在了本章里。

## 格式

### 纯文本

纯文本指文档将所有内容以文本形式进行存储。这种方式有一些很明显的好处

- 通用，可以在任何有文本编辑器的设备上对其进行修改和查看
- 版本控制友好，Git 的 diff/merge 等功能都可以正常使用

对于图片、视频、字体等资源，可以通过文件引用的方式将其包含在文档中

#### Markdown

Markdown 是一种标记语言，可理解为语法更简单的 **HTML**，因此算是 *HTMLite*。但同时大多数 Markdown 标准又支持内嵌 **HTML** 元素，因此 HTML 能做的 Markdown 都能做，算是个 *SuperHTML*。

我非常喜欢 Markdown 格式。虽然 Markdown 也有缺点，但我认为这就是最好的格式

  1. 优点
    - 以文本形式存储。如前所述，这使得 Markdown 具有极强的通用性，且便于进行版本控制。
    - 语法简单。Markdown 的语法非常接近纯文本，没有需要记忆的关键字。
    - 完美的源格式。Markdown 可以通过格式转换工具转换成 HTML、PDF、PPTX 等适合展示的格式，也可以通过静态网站生成器生成可部署的静态网站。Markdown 配合各种工具真正做到了 **内容和样式的分离**，也真正做到了 **一种形式编写多种形式展示**。
    - 应用广泛。Markdown 是软件工程里最主流的文档格式，同时 Github 的自述文件、LLM 的原始输出也基本都是 Markdown 格式。
  2. 缺点
    - 没有统一的标准。Github、Obsidian、Pandoc 等都有自己拓展的 Markdown 语法。如果过度依赖某个专有的特性，那么文档迁移会有点麻烦。
    - 排版和样式的功能欠缺。这导致 Markdown 转换为 PDF 会比较麻烦，通常要借助别的格式。

#### LaTeX

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

#### Typst

Typst 类似 LaTeX，不过针对 LaTeX 的许多问题进行了改进。个人体验下来，相比 LaTeX 的主要优势为

- 编译速度更快。Typst 生成 PDF 的速度比 LaTeX 快非常多
- 语法更简单。Typst 语法比 LaTeX 更简洁和直观，学习曲线也更平缓。当然这一点两者都比不了 Markdown
- 中文支持更友好。LaTeX 编译中文文档会比较麻烦，而 Typst 则根本不需要额外设置，原生就支持 UTF-8 字符集

当然，Typst 也有一些缺点，这些缺点主要是因为 Typst 太年轻。LaTeX 有丰富的模板，无数的宏包，到处都是教程和指南，出版社、期刊等接受度也更高。不过我还是希望 Typst 能够成功，让写作排版多一个选择。

#### HTML

HTML 全称为 `超文本标记语言`。HTML 相比 PDF 更注重内容和样式而不是排版，因此不适合对排版有严格要求的场合。

HTML 使用类似 XML 的标签嵌套语法。HTML 中可以嵌入或引用 CSS/JavaScript，浏览器能够渲染 HTML、解析 CSS、运行 JavaScript。因此 HTML 事实上不仅是文档，更是一个应用。

HTML 可以直接用文本编辑器编辑，也可以通过 Markdown 等格式转换而来。HTML 是 Web 应用的核心，有很多框架可以快速制作 Web 应用，可阅读 [Web 开发](../应用开发/Web.md) 章节了解更多。

### 非纯文本

非纯文本指文档不以纯文本形式存储所有内容。这有几种不同的实现方式

- 压缩打包。文档本质上仍然以文本形式存储，只不过打包并改成了新的后缀格式。这通常被叫做容器文件
- 页面描述。文档使用了一些二进制指令来描述页面的布局、内容等。这种文档通常由一种编程语言演化而来

当然了，相对纯文本存储，这样做会有一些缺点

- 不通用，文件必须使用特定的软件才能编辑和查看
- 版本控制不友好，Git 无法使用 diff/merge 等功能

#### DOCX

DOCX 类似 LaTeX，是一个写作排版系统。DOCX 以 *所见即所得* 的方式进行写作排版，因此经常被滥用：很多人将 DOCX 作为最终交付的文档格式，尽管它是为写作而非阅读设计的。

DOCX 是一种开放的文档格式，其本质是一个压缩包，解压后会看到 XML 等各种文件。

一般不直接修改 DOCX 的内部文件，而是使用专门的软件进行编辑，比如 **Microsoft Word** 或 **LibreOffice Writer**。Markdown、LaTeX 等也可以借助工具转为 DOCX。

尽管 DOCX 在普通用户中非常流行，但多数开发者都不喜欢这种格式。原因有很多，比如

- 不以纯文本形式存储。如前所述，这使得 DOCX 不通用且版本控制不友好。
- 没有强制的规范，容易写出低质量的文档。比如，对于样式的更改，很多人只是选中几个字然后手动调整，不懂得应该先创建一个新的样式，然后再将选中的文字改成自定义样式，这会让后续的修改、维护变得麻烦

#### PPTX

PPTX 将内容以幻灯片的方式进行展示，一般用于现场演示。

> [!Note]- PPT 和幻灯片
> 对于幻灯片（Slide），[维基百科](https://en.wikipedia.org/wiki/Presentation_slide) 上的解释是
>
> > 幻灯片是演示文稿的单页。一组幻灯片称为幻灯片套件。幻灯片演示是在电子设备或投影屏幕上展示一系列幻灯片或图像。
>
> 因此虽然 PPT/PPTX 现在成为了幻灯片的同义词，但它始终只是一种能进行幻灯片演示的格式。
>
> 如果你只是需要以幻灯片的方式展示内容，那么你不一定非得选择 PPTX。HTML 同样能进行幻灯片演示，而且效果并不差。

PPTX 和 DOCX 的实现类似，本质也是个包含了 XML 等各种文件的压缩包。

PPTX 通常要使用别的软件进行编辑，比如 **Microsoft PowerPoint** 或 **LibreOffice Impress**。LaTeX 可以用 Beamer 制作 PPTX，Markdown 也能借助工具转成 PPTX。

#### EPUB

EPUB 全称为 `电子出版物`。EPUB 类似 HTML 专门为电子设备的阅读体验而设计，不像 PDF 那种专门为打印成纸张而设计。

EPUB 本质上也是一个压缩包，里面包含了 HTML、CSS、XHTML、XML 等文件，可以看作是对静态 Web 应用的打包。

EPUB 通常要使用别的工具进行编辑，比如 **Sigil** 或 **calibre**。Markdown 和 HTML 等格式也能借助工具制作 EPUB。

#### PDF

PDF 全称为 `可携带文档格式`。对排版有严格需求的场合（比如书籍出版、论文打印）通常都会使用 PDF 格式。

PDF 内部使用文本和二进制混合的格式，文本部分使用类似 PostScript 的语言定义文档结构，二进制部分主要是压缩后的资源数据和内容，整个文档是自包含和扁平化的。

虽然有软件可以直接编辑 PDF 文件，但一般不这么做，而是将别的更易编辑的格式转为 PDF 格式。DOCX、LaTeX、Typst 直接就可以将文档转为 PDF 格式，而 Markdown、HTML 等借助工具也可以做到。

## 工具

### 文档转换

用来在不同文档格式之间进行转换的工具

- [Pandoc](Pandoc.md) 文档转换工具，支持多种格式，包括 Markdown、LaTeX、Typst、DOCX、HTML、PDF、PPTX 等
- [Marp](Marp.md) 用 Markdown 制作幻灯片的工具
- MarkItDown 微软开源的将各种格式转为 Markdown 的工具
- Tesseract 将图片转为文字的工具，使用 OCR 技术，可识别多种语言
- OCRmyPDF 在 PDF 上添加文本层，OCR 引擎为 Tesseract

### 文档阅读

用于阅读文档、查看图片、播放多媒体的工具

- glow 终端 Markdown 渲染器，功能非常有限，但至少比直接阅读源代码更舒服一点
- SumatraPDF 开源的 PDF/EPUB 阅读器，非常轻量和快速，没有臃肿的功能
- ImageGlass 开源的图片查看器，提供了简易的编辑功能
- VLC 开源的多媒体播放器

### 文档制作

用来制作文档的工具。由于这些工具比较多，所以又细分了一下

#### 内容制作

用于创建、编辑文档的工具。

对于 Markdown、HTML、LaTeX、Typst 这种存储为纯文本的文档，所有文本编辑器都可以对其进行修改。此处不列举这些文本编辑器，详见 [编辑器](../编辑器/index.md) 章节

- LibreOffice 可以认为是开源版的 `Microsoft Office`，包含了 DOCX、PPTX 等格式的编辑器
- Sigil 一个 EPUB 编辑器

> [!Note]- VSCode 拓展
> 一些 VSCode 拓展能为文档编辑提供便利，甚至可以拓展的原有格式。因此将其归类到文档编辑工具中
>
> - [Foam](https://marketplace.visualstudio.com/items?itemName=foam.foam-vscode) 增强了 Markdown 的功能，新增 **双链**、**嵌入**、**图谱** 等特性，类似 `Obsidian`，使得可以用 Markdown 打造个人知识库。
> - [markdownlint](https://marketplace.visualstudio.com/items?itemName=DavidAnson.vscode-markdownlint) 提供实时的 Markdown 静态检查和简单的 Markdown 格式化
> - [Markdown All in One](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) 全面的 Markdown 增强，提供了创建/更新目录、数学公式自动补全、常用快捷键等功能
> - [Markdown Table](https://marketplace.visualstudio.com/items?itemName=TakumiI.markdowntable) 增强了 Markdown 的表格功能，包括快速插入行/列、格式化/美化表格、将 CSV/TSV 转为 Markdown 表格等
> - [Markdown Image](https://marketplace.visualstudio.com/items?itemName=hancel.markdown-image) 增强了 Markdown 的图片功能，可以更方便地将图片插入 Markdown 文档中
> - [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) 为 LaTeX 提供了编辑器支持
> - [Tinymist Typst](https://marketplace.visualstudio.com/items?itemName=myriad-dreamin.tinymist) 为 Typst 提供了编辑器支持

#### 资源制作

用于创建、编辑图片、视频等资源文件的工具。

关于图片

- [Mermaid](Mermaid.md) 一个基于 JavaScript 的图表绘制工具，可以用简单的代码生成图表。类似的工具还有 `plantUML`
- Graphviz 代码生成图片的工具，`Doxygen`/`plantUML` 等都使用它作为底层引擎
- QRencode 二维码生成工具，可对输入的文本进行编码
- Inkscape 矢量图编辑器
- Krita 数字绘画工具

关于视频

- Manim 用来生成数学动画的 Python 库，最初由 3blue1brown 制作，现在更推荐使用社区维护的版本
- vhs 终端录像生成工具。和 `script`、`asciinema` 等工具不同，vhs 可根据要求自动生成录像
- Kdenlive 视频编辑器

#### 拼写检查

用于拼写检查的工具

- autocorrect 针对 CJK 和英文混合编写的场景，可以自动检查并纠正标点不规范、拼写错误等问题
- typos 一个源代码拼写检查工具，误报率相当低。该工具使用黑名单，只针对已知的拼写错误，不检查未知单词

> [!Note]- VSCode 拓展
> 一些 VSCode 拓展也能提供拼写检查功能。尽管没有命令行工具的版本，但也归类到拼写检查工具中
>
> - [Code Spell Checker](https://marketplace.visualstudio.com/items?itemName=streetsidesoftware.code-spell-checker) 只检查英文的拼写。由于使用白名单，因此可能得手动添加很多单词

#### 代码嵌入

让文档里能够嵌入可执行代码的工具。这些工具通常都会使用自定义的文件格式。

- [Jupyter](../编辑器/Jupyter.md) 交互式编程笔记本，功能非常强大。我把它放入了 *编辑器* 这一章节
- [Quarto](Quarto.md) 基于 Pandoc 和 Jupyter 构建的开源科技出版系统

#### 代码文档生成器

能够根据源代码自动生成文档的工具。这些工具能够理解语言的接口定义，但通常还需要以约定好的注释格式提供额外的接口信息。

大多数编程语言都有官方的文档生成工具，通常这就是最好的。只有某些无官方实现的语言（点名 *C/C++*）才需要使用别的工具。

- [Doxygen](Doxygen.md) 可以导出 PDF、HTML 等格式，支持多种语言，但一般只用于 C/C++ 项目

#### 静态网站生成器

用于生成静态网站的工具。这些工具通常会根据配置文件中指定的主题、样式等信息，将 Markdown 文档转为可直接部署的静态网站。

- [MkDocs](MkDocs.md) 一个用 Python 写的静态网站生成器，本网站就是使用这个制作的
- VitePress 通过 Vite 和 Vue 驱动，样式很好看
- [Hugo](Hugo.md) 一个用 Go 实现的静态网站生成器，构建速度很快

### 综合处理

可以用来对一些格式进行各种操作的综合工具。因为功能比较多，不太好分类，所以放到了这里

- [PDFcpu](PDFcpu.md) 一个对 PDF 文档进行各种处理的命令行工具。类似的还有 `qpdf`、`xpdf`、`pdftk`、`poppler`、`GhostScript`
- [ImageMagick](ImageMagick.md) 一个对图片进行各种处理的命令行工具。类似的还有 `chafa`、`resvg`
- [FFmpeg](FFmpeg.md) 一种可以对音视频进行各种处理的命令行工具
