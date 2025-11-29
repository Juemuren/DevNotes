# 文档工具

## 基本概念

文档，或者在这里应该称为电子文档，是这个时代每个人都要与之打交道的东西。对于学生，需要写报告，可能还有人会记电子笔记、看电子书；对于开发者，需要写架构文档、需求文档、设计文档等很多文档，也经常需要去一些编程语言、开发工具的官网查看文档；对于研究者，需要看论文、写论文。而对于所有使用浏览器的人而言，浏览器的页面，即 HTML，本身也是一种文档。

因此，认识常见的几种文档格式，了解一些有关文档的工具，是很有必要的。

这里只简单介绍一些我经常遇到的文档格式，和经常使用的文档工具。

## 格式

### Docx

我不太喜欢 docx 格式，原因非常多，我只列举部分好了

- 不通用，兼容性差。由于 docx 将数据以特殊的二进制形式存储，导致文件必须使用特定的软件才能编辑和查看。我相信大部分人都遇到过自己的保存的 docx 文件在别人的电脑里打不开的情况
- 版本控制不友好。这又是因为 docx 以二进制格式存储数据，导致 git 无法只记录提交间的差异，而不得不记录整个文件。这导致 git 的提交记录非常庞大，同时也没有办法通过 diff 查看每次提交间的差异
- 没有强制的规范。这条比较主观，也许没有强制规范不是缺点，但因为太多人根本就不会使用 docx，所以我认为这成了缺点。比如，对于样式的更改，很多人只是选中几个字然后手动调整，不懂得应该先创建一个新的样式，然后再将选中的文字改成自定义样式。Microsoft Word 极低的使用门槛、过于灵活的样式导致市面上存在大量的低质文档，这种文档修改、维护起来都非常麻烦

当然了，同样由于使用门槛低，docx 可能是在普通用户中最为流行的文档格式。对于不喜欢 docx 的开发者而言，也有很多工具将别的格式的文档转为 docx 格式的文档。

### Markdown

Markdown 是一种标记语言，可理解为语法更简单的 **HTML**，因此算是 *HTMLite*。但同时大多数 Markdown 标准又支持内嵌 **HTML** 元素，因此 HTML 能做的 Markdown 都能做，算是个 *SuperHTML*。

我非常喜欢 markdown 格式。虽然 markdown 也有缺点，但我认为这就是最完美的格式

  1. 优点
    - 极强的通用性和跨平台性。由于 markdown 直接以文本形式存储数据，不依赖特定的软件，因此可以在几乎所有设备上编辑和查看，包括手表、随身听等。不过要渲染出特定的样式仍然是需要渲染器的。
    - 版本控制友好。这还是因为 markdown 以文本形式存储数据。在 git 里，可以通过 diff 查看不同提交之间的差异，提交记录也不会变得很大。
    - 语法简单。如果你写过 LaTeX，应该会对这一点深有感触的。
    - 完美的源格式。可以通过 Pandoc 等格式转换工具转成 HTML、PDF、PPTX 等适合展示的格式，也可以通过 MkDocs 等静态网站生成器直接生成静态网站。markdown 配合各种工具真正做到了**内容和样式的分离**，也真正做到了**一种形式编写多种形式展示**
    - 良好的生态和无限的前景。在今天，markdown 应该是软件工程里最主流的文档格式；在 Github 上，markdown 是自述文件（即 README）最推荐使用的格式；大多数 LLM（包括 DeepSeek、ChatGPT 等）都是直接输出 markdown 的（如果你尝试点击 *复制* 按钮，就会发现剪贴板里其实是 markdown 格式的文本），也基本都可以理解 markdown 格式的输入
  2. 缺点
    - 没有统一的标准。Github 有 Github 风味的 Markdown，Obsidian 有 Obsidian 风味的 Markdown，Pandoc 也有自己拓展的 Markdown 语法。如果过度依赖某个专有的特性，那么文档迁移会有点麻烦。
    - 排版和样式的功能欠缺。这导致转换为 PDF 等格式会比较麻烦。

### LaTeX

LaTeX 是非常古老的排版系统，和 markdown 一样以文本形式存储数据，但相比 markdown 有一些区别

- 语法更复杂
- 排版功能更好。markdown 事实上并没有排版功能，而 LaTeX 则是排版领域的顶点
- 生态不如 markdown。比如大多数静态网站生成器都只支持 markdown 格式的内容，比如 LLM 输出的内容并不是 LaTeX，再比如 Github 的自述文件也不支持 LaTeX

LaTeX 最大的贡献也许就是完整定义了一套数学符号的语法。数学公式算是排版中最大的难题，而 LaTeX 几乎完美地解决了。这种语法在一些别的格式中也得到了支持，比如 Markdown。当然 Markdown 的标准是不统一的，有些支持有些不支持。下面就是我用 Markdown 内嵌 TeX 写的 *麦克斯韦方程组微分形式*，而这被静态网站生成器转为 **HTML** 后由 `KaTeX` 进行了渲染

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

LaTeX 有很多的发行版，比如 Texlive 和 MikTeX。我个人更喜欢 MikTeX。另外还有一个更现代的选择，即 Tectonic。它不会下载完整的 TeX 系统，而是在编译时自动下载宏包，初次使用 TeX 的话非常推荐先试试这个。

### Typst

Typst 的出现是为了解决 LaTeX 的一些问题。LaTeX 非常古老，而 Typst 则是最近才出现的，针对 LaTeX 的许多问题进行了重新设计，并且使用了现代的语言 Rust 来实现。个人体验下来，和 LaTeX 的主要差别大概有

- 编译速度更快。Typst 生成 PDF 的速度比 LaTeX 快非常多
- 语法更简单。但还是比 Markdown 更复杂一点
- 中文支持更友好。LaTeX 要编译中文文档会比较麻烦，而 Typst 则根本不需要额外设置，原生就支持 UTF-8 字符集

当然，Typst 也有一些缺点，这些缺点主要是因为 Typst 太年轻。LaTeX 有丰富的模板，到处都是教程和指南，渲染引擎更稳定，出版社、期刊等接受度更高。不过我还是希望 Typst 能够成功，让写作排版多一个选择。

### PDF

这是一个适合用来展示的格式，对于排版有严格需求的时候常会使用这个格式，比如书籍出版、论文打印等。

Docx、LaTeX、Typst 直接就可以将文档转为 PDF 格式，而 Markdown、HTML 借助工具也可以做到。

### HTML

这也是一个适合展示的格式，但相对更注重内容和样式而不是排版。

浏览器就使用 HTML 展示内容，在不同大小的屏幕上都能显示得很好。但 HTML 不适合书籍出版这些对排版有严格要求的场合。

### PPTX

这又是一个适合用来展示的格式，一般用于现场演示。

LaTeX 可以用 beamer 制作 PPT，而 Markdown 借助工具也能制作 PPT。当然更常见的是用 Microsoft PowerPoint 制作 PPT。

## 工具

### 综合处理

可以用来对一些格式的文件进行各种操作的综合工具。因为功能比较多，不太好分类，所以放到了这里

- [PDFcpu](PDFcpu.md) 一个对 PDF 文档进行各种处理的命令行工具。类似的还有 `qpdf`、`xpdf`、`pdftk`、`GhostScript`，最后一个工具类似 `awk`，有自己的一套语言，很强大但学习曲线很高。
- [ImageMagick](ImageMagick.md) 一个对图片进行各种处理的命令行工具。类似的还有 `chafa`，但功能没有那么丰富，主要用于在终端显示图片和制作 ANSI 艺术品。

### 图表演示

可以用来生成表格、静态图片、动态图片，或者演示视频的工具

- [Mermaid](Mermaid.md) 一个基于 JavaScript 的图表绘制工具，可以通过简单的代码绘制图表。类似的工具还有 `plantUML`，不过后者基于 Java，生态不如前者好
- Graphviz 代码生成图片的工具，`plantUML` 的底层就使用了这个工具
- QRencode 文本转二维码的命令行工具
- Manim 用来生成数学动画的 Python 库，最初是由 3blue1brown 制作的，现在更推荐使用社区维护的版本
- vhs 终端录像生成工具。和 `script`、`asciinema` 等工具不同，vhs 会根据你提供的要求，比如输入的命令、打字速度、画面大小等自动生成录像。这非常适合用来制作 CLI 应用的演示视频，毕竟自己手打命令的话，不小心操作失误可能就得重新录制。

### 格式转换

用来在不同格式之间进行转换的工具

- [Pandoc](Pandoc.md) 文档格式转换工具，非常强大，支持非常多的格式互相转换，包括 Markdown、LaTeX、Typst、Docx、HTML、PDF、PPTX 等。
- [Marp](Marp.md) 一种专门将 Markdown 转换为幻灯片的工具
- markitdown 微软官方的做的一个把各种格式的文件转为 markdown 的工具，甚至可以处理 YouTube 链接 ~~实际上只是把字幕文件转化为 markdown 文件，不要以为能够一帧一帧地转换视频内容~~ 。在 LLM 盛行的时代，非常适合炒作这个工具 `:)`，可以用来把所有东西都转换成 Markdown 然后全部喂给 AI。

### 代码内嵌

我对这类工具的定义就是让文档里可以嵌入代码，并且这些代码可以被实际执行。也正因有了可以实际执行的代码，这些文档不再是纯粹的文档了，所以这些工具通常都会使用自定义的文件格式。

- [Jupyter](../编辑器/Jupyter.md) 交互式编程笔记本，功能非常强大。我把它放入了 *编辑器* 这一章节。
- [Quarto](Quarto.md) 基于 Pandoc 和 Jupyter 构建的开源科技出版系统。

### 文档生成

自动根据源代码生成参考文档的工具。这些工具能够理解某种语言的接口定义，但通常还需要通过一些约定好的注释格式来提供额外的接口信息。

大多数编程语言都有官方的文档生成工具，通常这就是最好的。只有某些无官方实现的语言（点名 *C/C++*）才需要使用别的工具。每个语言的社区通常都会形成默契，只按照一种约定格式写注释，这对于大规模的协作无疑是好事，也有利于工具链的统一。

- [Doxygen](Doxygen.md) 可以导出 PDF、HTML 等格式，支持多种语言，但一般只用于 C/C++ 项目

### 静态网站生成器

静态网站生成器是一类很强大的工具。它可以将 Markdown 或别的格式编写的内容，根据配置文件中指定的主题、样式等信息，转换成可以直接部署的静态 HTML 页面。

这类工具非常多，选择的时候重要关注的几个点是主题、样式是否丰富，配置是否省心，有没有拓展功能，构建速度快不快等。

- [MkDocs](MkDocs.md) 一个用 Python 写的静态网站生成器，本网站就是使用这个制作的
- VitePress 通过 Vite 和 Vue 驱动，算是 Vue 生态的一部分，是 VuePress 的更现代的版本
- [Hugo](Hugo.md) 一个构建速度很快的静态网站生成器，配置麻烦但更灵活
