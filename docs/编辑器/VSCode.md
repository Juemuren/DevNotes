# VSCode

[官网](https://code.visualstudio.com/)

## 安装

建议使用官网的安装程序。VSCode 的安装程序还是非常友好的

## 插件推荐

和特定编程语言有关的或和特定工具有关的插件就不列举在这里了，可以在相关的对应的章节查看

### 本地化

- **Chinese (Simplified) (简体中文) Language Pack for Visual Studio Code** 中文本地化插件

### 实用

- **EditorConfig for VS Code** 可以在不同的编辑器间使用相同的配置，包括缩进格式、编码方式、行尾序列等。如果参与开源项目的协作，通常都会要求安装这个插件。
- **Project Manager** 为 VSCode 提供了一个项目管理视图
- **Todo Tree** 识别代码中的所有 TODO、FIXME 等特殊注释，并在一个视图中显示出来
- **Bookmarks** 代码书签。可以有一个视图里显示收藏的代码。我没怎么用过这个插件
- **Vim** 提供类似 Vim 的无鼠标编辑体验

### 外观

- **CodeSnap** 生成好看的代码截图
- **Error Lens** 把错误/警告/信息等直接显示在该行，而不是要打开视图才能查看
- **ident-rainbow** 给缩进高亮，让你能够清楚地看出缩进层数
- **Output Colorizer** 为 VSCode 的输出面板和 log 文件着色

### 主题

美化就是生产力！

- **Material Icon Theme** 比默认图标更好看（主观）的图标。
- **One Dark Pro** 我很喜欢的一个主题。

### 文档编写

- **Code Spell Checker** 拼写检查。一般源代码不用这个插件，因为代码里出现的英文单词一般都不是很规范，比如各种奇怪的缩写，得一个个排除掉，有点麻烦。编写文档的时候可能会使用，但使用起来还是有点麻烦。比如本站的所有文档，为了让插件知道那些奇奇怪怪的工具名不是错误拼写，我添加了近百个单词，未来可能还会更多。虽然如此，但这个插件还是帮我检查出了不少错误拼写的 `:(`
- **Foam** 增强了 Markdown 的功能，包括 **双链**、**嵌入**、**图谱**等，类似于 Obsidian，使得可以用 Markdown 打造个人知识库。当然，可以通过配置插件，让静态站点生成器支持拓展的语法。

### 版本控制

我平常只使用 VSCode 自带的 Git 拓展，并偶尔结合命令行操作。很少使用 Git 的相关插件

- **Git Graph** 增强 Git，以图形的方式显示 git 历史，并支持丰富的操作。
- **Gitlens** 会把 git 历史信息直接显示在该行，另外还有其它功能，感觉有点臃肿。

### 远程开发

远程开发似乎是 VSCode 的最大优势，也是很多人看中 VSCode 的原因。不过我个人很少用到远程开发

  - **Remote Development** 包含了下面 4 个拓展的拓展包
    - **WSL** 支持在 VSCode 中打开 WSL 中的文件夹
    - **Dev Containers** 支持在 VSCode 中打开容器中的文件夹
    - **Remote - SSH** 支持在 VSCode 中通过 SSH 连接到远程机器
    - **Remote - Tunnels** 支持在 VSCode 中通过 Tunnel 连接到远程机器
  - **Remote Repositories** 包含了下面 2 个拓展的拓展包
    - **GitHub Repositories** 远程浏览和编辑 GitHub 仓库。如果某些仓库特别大不适合 clone 到本地的话，这个插件非常方便
    - **Azure Repos** 远程浏览和编辑 Azure 仓库
  - **Remote Explorer** 提供了一个视图显示可连接的远程机器列表，让 *Remote - SSH* 和 *Remote - Tunnels* 用起来更方便

### 文件支持

- **Office Viewer** 支持在 VSCode 里查看非常多种的格式，包括 docx、xlsx、pdf、ttf、zip 等
- **Mermaid Chart** 提供了 Mermaid 的语言服务。功能很多，略微臃肿。
- **PlantUML** 提供了 PlantUML 的语言服务。
- **YAML** 提供了 YAML 的语言服务
- **Even Better** TOML 提供了 TOML 的语言服务
- **Jupyter** 提供了对交互式编程笔记本的支持

## 配置文件管理

启用太多插件可能会导致一些问题，比如占用内存变大、启动变慢等。但每打开一个不同的项目就要手动禁用、启用插件也太麻烦了。配置文件的出现就是为了解决这个问题的

这个配置文件不仅支持为不同的项目配置不同的插件，还可以配置不同的设置、键盘快捷方式、任务、代码片段等，功能非常强大

具体如何使用取决于个人习惯，而且目前功能似乎不太完善，比如[配置文件不能继承](https://code.visualstudio.com/docs/configure/profiles#_can-i-inherit-settings-from-another-profile)。有需求的话建议去阅读[官方文档](https://code.visualstudio.com/docs/configure/profiles)

## 命令行

是的，VSCode 还提供了命令行工具 `code`，不过我一般很少使用这个东西

可以使用  `code .` 在 VSCode 中打开当前目录，用 `code text.c` 在 VSCode 中打开单个文件

另外可以用这个工具列出所有已安装插件

```sh
code --list-extensions
# 用 nl 为拓展列表加上行号
code --list-extensions | nl
```

插件实际存储在 `~/.vscode/extensions` 里，也可以直接在文件资源管理器中查看
