# Mermaid

[官网](https://github.com/mermaid-js/mermaid-cli)

## 简介

Mermaid 是一个基于 JavaScript 的图表绘制工具，可以通过简单的代码绘制图表。

## 对比

Mermaid 这个工具流行的主要原因就是可以把代码嵌入 MD 文档中。毕竟大多数时候 MD 都会转为 HTML，因此基于 JavaScript 是个巨大的优势，让 Mermaid 可以直接在客户端完成图片的渲染。比如 Github 的 MD 就支持渲染内嵌的 mermaid 代码，大多数 LLM（比如 DeepSeek）也基本都是用 mermaid 来展示图片的。但这种方法有时会出现问题，比如你可能已经遇到过的 *渲染失败* 这一情况，尽管代码被正确传输了，但客户端可能因为各种原因而无法渲染图片。

Mermaid 还有个 CLI 工具，可以本地完成图片的导出。可以选择 png 或 svg 格式的图片，可以自定义 css 文件，还可以一键把 md 里所有内嵌的 mermaid 导出为图片，并在新输出的 md 文件里引用这些图片。最后一个功能我很喜欢，因为可以配合 pandoc 轻松地让 LLM 生成一个图文并茂的 docx 文档

plantUML 是另一种绘制 UML 图表的工具，同样通过代码生成图表。plantUML 图的种类似乎比 mermaid 更丰富一点，但由于是用 Java 实现的，所以体验和生态都没有Mermaid 好。plantUML 一般用来本地生成图片，然后再把图片插入文档，Mermaid 更适合直接提供代码，让接收者自行渲染。

后面只介绍 mermaid-cli 的安装和使用。而对于客户端渲染的需要，大多数 *静态网站生成器* 和 *前端框架* 应该都支持与 mermaid 集成，你可以自行研究。

## 安装

目前 mermaid-cli 的安装非常麻烦，因为没有打包成单个二进制文件，必须安装 NodeJS 运行时并通过 npm 下载。有能力的或者感兴趣的可以看看 [GitHub Issues](https://github.com/mermaid-js/mermaid-cli/issues/467) 来帮忙解决这个问题

整个安装流程大概是这样的

```sh
# 首先设置 PUPPETEER_SKIP_DOWNLOAD，我不设置这个就会报错
$env:PUPPETEER_SKIP_DOWNLOAD=1
# 然后全局安装 mermaid-cli
npm install -g @mermaid-js/mermaid-cli
# 最后再单独安装 chrome-headless，如果已经有的话可以不安装
npx puppeteer browsers install chrome-headless-shell
```

至此就安装完成了，但使用的时候还有些东西需要注意。首先写一个 `"puppeteer.json"` 文件，指定 `chrome-headless` 可执行文件的路径。对于 Windows，可执行文件一般放在 `~/.cache/puppeteer` 目录里，可以自己找找。

```json
{
  "executablePath": "path\\to\\chrome-headless-shell.exe"
}
```

最后使用的时候记得通过 `-p puppeteer.json` 提供这个文件

```sh
mmdc -p puppeteer.json -i example.md -o example.temp.md
```

## 使用

后面的使用示例省略了 `-p` 这个参数

```sh
# 单独导出一个图片
mmdc -i input.mmd -o output.png
# 自定义 css 文件
mmdc --input flowchart.mmd --cssFile flowchart.css -o flowchart.svg
# 转换 md 文件，让接收者直得到图片，不用自行渲染
mmdc -i readme.template.md -o readme.md
```
