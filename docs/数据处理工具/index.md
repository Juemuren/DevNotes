# 数据处理工具

## 基本概念

数据处理是这个信息时代中的一项重要活动。对于开发者而言，有必要认识一些常见的数据格式，并学会使用工具进行数据处理。

相比于二进制数据，本文更关注文本数据。另外文档、图片、视频等某种程度上也算是数据，但这些内容放到了[文档](../文档工具/index.md)章节中。

## 格式

### 嵌套型数据

| 需求           | 适合格式  | 原因              |
| :------------- | :-------- | :---------------- |
| **人工编写**   | YAML/TOML | 可读性强/支持注释 |
| **浅层嵌套**   | TOML      | 使用路径          |
| **深层嵌套**   | YAML      | 使用缩进          |
| **机器处理**   | JSON      | 解析快速/广泛支持 |
| **数据传输**   | JSON      | JavaScript 原生   |
| **文档型数据** | XML       | 命名空间/属性信息 |

#### JSON

JSON 全称为 `JavaScript 对象表示法`。顾名思义，JavaScript 就使用这种格式表示对象，因此 JavaScript 序列化和反序列化 JSON 都非常方便。

JSON 是机器友好的，因此解析起来特别快速。但 JSON 不是人类友好的，文件中充斥着 `{}[]()",` 这些符号，非常影响阅读和修改。

JSON 经常会在和 JavaScript 有关的场合被用到，比如通过 HTTP 传输的数据、VSCode 的配置文件等。

#### YAML

YAML 很类似 JSON，但为了便于人类读写而做了很多优化。

YAML 是人类友好的，使用缩进和约定消除了 JSON 中的那些冗余符号，且原生支持注释。但这也导致它不是机器友好的，解析起来比 JSON 更慢一点。

YAML 常被用于配置文件，比如 Docker/Kubernetes/GitHub Actions 等都选择了 YAML。

#### TOML

TOML 算是 INI 的升级版，同样使用键值对并支持分节，不过 TOML 还允许嵌套的组织结构。

TOML 是人类友好的，不过更适用于扁平的结构，那种非常深的嵌套 TOML 写起来要比 JSON/YAML/XML 麻烦许多。

TOML 被一些新兴语言用作项目配置文件，比如 Rust 和 Julia。TOML 现在随着新兴工具的流行而越来越常见，Python 社区也逐渐接受了使用 TOML 作为项目配置文件。

#### XML

XML 全称为 `可拓展标记语言`，使用标签来组织数据和结构，并且标签可以嵌套和附加属性。

XML 是机器友好的，适合深度嵌套和需要属性信息、命名空间的数据。

XML 早期在 Web 中常用于传输数据，不过目前已几乎被 JSON 取代。另外 XML 还被很多软件选为内部格式，比如 Microsoft Office 的那些文档（包括 docx/xlsx/pptx）解压后其实就是一些包含了 XML 的文件、VLC 的皮肤文件解压后也包含了 XML 文件、SimulIDE 的电路图实际保存为一个 XML 文件。

### 表格型数据

| 特性         | CSV          | TSV          |
| :----------- | :----------- | :----------- |
| **转义需求** | 经常需要转义 | 很少需要转义 |
| **可读性**   | 通常对不齐   | 对得更整齐   |
| **通用性**   | 更常见       | 更不常见     |

#### CSV

CSV 全称为 `逗号分隔值`。顾名思义，CSV 通过逗号隔开每个值。

CSV 在电子表格、数据库导入/导出、数据科学等领域中很常见。

#### TSV

TSV 全称为 `制表符分隔值`。顾名思义，TSV 通过制表符隔开每个值。

TSV 相比 CSV 通常解析更快，且制表符相对而言更少需要转义，也更容易在编辑器中对齐，从而易于人工编辑。

## 工具

### 文本处理

文本处理工具主要用于没有特定格式的文本数据。

> [!Note]+ Linux 文本处理工具
> 多数 Linux 系统都预装了一大堆用于文本处理的工具，比如
>
> - 通用处理 `awk`
> - 编辑 `sed`
> - 查找 `grep`
> - 截取 `cut`/`head`/`tail`
> - 合并 `paste`/`join`
> - 拆分 `split`/`csplit`
> - 排序 `sort`
> - 去重 `uniq`
> - 统计 `wc`
> - 替换 `tr`
> - 比较 `comm`/`diff`
> - 格式化 `nl`/`column`
> - 随机化 `shuf`
> - 编码转换 `iconv`/`basenc`
>
> 尽管本文不详细介绍这些工具，但它们同样是非常有用的，并且启发了很多新工具。

- [fzf](Fzf.md) 模糊查找器，可以看作一个交互式的 `grep`。fzf 提供了 shell 集成方法，能够显著改善终端的使用体验
- [ripgrep](Ripgrep.md) 文本查找器，类似 `grep` 但更现代
- [sd](Sd.md) 文本查找替换器，类似 `sed` 但更现代
- [delta](Delta.md) 对 git/diff 等命令的输出进行语法高亮和分页，方便查看
- jc 把很多常用命令的输出转为 JSON 格式，方便后续处理
- argos-translate 命令行离线翻译器，基于神经网络模型

### 格式处理

格式处理工具主要用于具有特定格式的文本数据。由于数据具有格式，因此这些工具通常会包含更多的功能，比如验证/转换格式、查询/替换特定字段的值等。

#### 代码格式

代码存在语法，因此也可以看成一种文本格式。虽说代码算不算数据可能有点争议，但我还是决定把它们归类为数据处理工具

- ast-grep 代码检索和修改工具，其搜索方式类似 `grep`，但匹配 `AST`（抽象语法树）而非文本，因此能够更安全地进行重构
- [bat](Bat.md) 显示文件内容，类似 `cat` 但更现代。支持语法高亮、显示行号等功能
- chroma 语法高亮器，可对输入进行语法高亮，支持非常多的语言和主题
- [cloc](Cloc.md) 统计代码行数，类似的工具还有 `tokei`

#### 专一格式

只能处理一种格式的**命令行工具**

- [jq](Jq.md) 命令行 JSON 处理器
- [yq](Yq.md) 命令行 YAML 处理器
- taplo 命令行 TOML 处理器
- xmlstarlet 命令行 XML 处理器
- mdq 命令行 Markdown 处理器
- qsv 命令行 CSV/TSV 处理器

为一种格式提供了语言服务的 **VSCode 拓展**。VSCode 已经自带了对 JSON 的支持

- [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml) 提供了 TOML 的语言服务
- [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) 提供了 YAML 的语言服务
- [XML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-xml) 提供了 XML 的语言服务
- [Rainbow CSV](https://marketplace.visualstudio.com/items?itemName=mechatroner.rainbow-csv) 提供了 CSV/TSV 的语言服务

#### 通用格式

可以处理多种文本格式

- miller 可以处理多种格式的数据，不过更适合表格型数据
- dasel 类似前者，不过更适合嵌套型数据
- [SQLite](SQLite.md) 关系型数据库，用 SQL 处理数据，支持读取 CSV、JSON 等各种文件。数据库本身非常轻量，可以用来处理日常任务或嵌入应用程序中
- Datasette 用于探索和发布数据，可将 CSV、SQLite 等格式的文件变成一个能交互的 Web 页面

可以处理多种二进制格式

- fq 类似 `jq` 但用于二进制数据
- rga 类似 `ripgrep` 但可以处理 PDF、压缩文件等各种非文本数据
- ExifTool 读取和编辑文件的元信息
