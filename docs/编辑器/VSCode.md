# VSCode

## 简介

VSCode 是一个开源的代码编辑器，基于 Web 且有着非常强大的插件生态。

## 安装

建议使用[官网](https://code.visualstudio.com/)的安装程序。VSCode 的安装程序还是非常友好的

## 插件推荐

和特定[编程语言](../编程语言/index.md)/特定[工具](../命令行工具/index.md)有关的插件就不列举在这里了，可以在相应的章节中查看

### 本地化

- **Chinese (Simplified) (简体中文) Language Pack for Visual Studio Code** 中文本地化插件

### 实用

- **EditorConfig for VS Code** 可以在不同的编辑器间使用相同的配置，包括缩进格式、编码方式、行尾序列等。如果参与开源项目的协作，通常都会要求安装这个插件。
- **Project Manager** 为 VSCode 提供了一个项目管理视图
- **Todo Tree** 识别代码中所有类似 `TODO`、`FIXME` 这样的特殊注释，并在一个视图中显示
- **Bookmarks** 代码书签。在一个视图中显示收藏的代码
- **Vim** 提供类似 Vim 的无鼠标编辑体验

### 外观

- **CodeSnap** 生成好看的代码截图
- **Error Lens** 把错误/警告/信息等直接显示在代码的同一行，而不是要打开别的面板才能查看
- **ident-rainbow** 给缩进高亮，让你能够清楚地看出缩进层数
- **Output Colorizer** 为 VSCode 的输出面板和 log 文件着色

### 主题

美化就是生产力！

- **Material Icon Theme** 比默认图标更好看（主观）的图标
- **One Dark Pro** 比默认主题更好看（主观）的主题

### 文档编写

- **Code Spell Checker** 拼写检查。虽然只检查英文的拼写，但仍然很有用，尤其是在编写文档的时候。
- **Foam** 拓展了 Markdown 的功能，新增**双链**、**嵌入**、**图谱**等特性，类似 Obsidian，使得可以用 Markdown 打造个人知识库。

### 版本控制

我平常只使用 VSCode 自带的 Git 拓展以及命令行 Git 操作，很少使用 Git 相关插件

- **Git Graph** 可以图形的方式显示 Git 提交历史，并支持丰富的操作。
- **Gitlens** 提供了非常多基于 Git 的功能，感觉有点臃肿。

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

## 配置文件管理

启用太多插件可能会导致一些问题，比如占用内存变大、启动变慢等。但每打开一个不同的项目就要手动禁用、启用插件又过于麻烦。配置文件的出现就是为了解决这个问题的，不仅支持为不同的项目配置不同的插件，还可以配置不同的设置、键盘快捷方式、任务、代码片段等，功能非常强大

配置文件的具体使用方式取决于个人习惯，而且目前功能似乎不太完善，比如[配置文件不能继承](https://code.visualstudio.com/docs/configure/profiles#_can-i-inherit-settings-from-another-profile)。有需求的话建议去阅读[官方文档](https://code.visualstudio.com/docs/configure/profiles)

## 命令行

VSCode 还提供了命令行工具 `code`，用法和其它的命令行编辑器很类似

```sh
# 打开当前目录
code .
# 打开单个文件
code text.c
```

除此之外这个工具还有很多别的功能

```sh
# 安装插件
code --install-extension rust-lang.rust-analyzer
# 卸载插件
code --uninstall-extension rust-lang.rust-analyzer
# 列出所有已安装插件
code --list-extensions
# 同时显示版本
code --list-extensions --show-versions
# 比较文件差异
code --diff file1 file2
```

可以运行 `code --help` 或阅读[官方文档](https://code.visualstudio.com/docs/configure/command-line)了解更多功能
