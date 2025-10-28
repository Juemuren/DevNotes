# Mise

## 简介

Mise 是个用来管理工具链版本和切换环境的工具，也可以充当任务运行器。

## 对比

作为工具链管理器，Mise 可以替代许多工具，比如 `nvm`、`pyenv` 等。这些程序通常只用来管理一个工具的版本，而 Mise 可以管理多种工具的版本。你可以在 [Mise Registry](https://mise.jdx.dev/registry.html#tools) 上查看 Mise 能够管理的所有工具。如果你正在使用多个不同工具的版本管理程序，那么 Mise 可能非常适合你。你不再需要记忆每种工具的用法，只需知道 Mise 怎么用就行了。

作为环境切换工具，Mise 是 `direnv` 的替代品。功能很简单，就是修改 *环境变量* 而已。

作为任务运行器，Mise 通过 `toml` 定义任务，语法和 `Make`、`Just` 差异很大。作为写习惯了 Make 的人，我还是更喜欢 [Just](../命令行工具/Just.md)，它改善了 Make 且语法类似。

## 安装

非常适合使用 Scoop 安装

```sh
scoop install mise
```

## 使用

我使用 Mise 主要就是为了管理语言的运行时版本。大多语言都有自己的工具，但我更喜欢 Mise 这种用一个工具解决所有语言运行版本管理的想法。对于 Mise 的其它功能我比较少使用，你可以阅读对应的文档来详细了解。

- [开发工具](https://mise.jdx.dev/dev-tools/)
- [环境变量](https://mise.jdx.dev/environments/)
- [任务](https://mise.jdx.dev/tasks/)

你可以在[官方文档](https://mise.jdx.dev/core-tools.html#core-tools)里看到目前 Mise 能够管理的语言运行时。我使用 Mise 主要是管理 Python、NodeJS、Go、Java 的运行时版本。Rust 的支持是实验性的，并且实际上就是给 rustup 包装了一下；而 Julia 目前不支持。因此对于后两者，我分别使用 rustup 和 juliaup 来管理版本

### Shell 集成

Mise 切换运行时版本是通过修改 *PATH* 实现的。因此，需要将 Mise 与 Shell 进行集成，不过官方的说法是激活。你可以阅读[官方文档](https://mise.jdx.dev/getting-started.html#activate-mise)了解如何激活 Mise。

对于 pwsh，需要往 `$PROFILE` 文件中添加如下命令

```sh
mise activate pwsh | Out-String | Invoke-Expression
```

激活成功后，Mise 就会自动更新 *PATH* 以确保你使用了正确的版本。

当然了，Mise 还有另一种切换运行时版本的方式，就是 *Shims*，它和修改 *PATH* 的方法略有不同。你可以去[官方文档](https://mise.jdx.dev/dev-tools/shims.html#mise-activate-shims)里详细了解。一般来说，*PATH* 是更推荐的选择。

### 基本使用

更改全局使用的运行时版本

```sh
# 全局使用 python 的 latest 版本
mise use -g python
# 全局使用 nodejs 的 lts 版本
mise use -g node@lts
# 全局使用 java 的 17 版本
mise use -g java@17
```

这会修改 `~/.config/mise/config.toml` 文件，添加类似这样的信息

```toml
[tools]
java = "17"
node = "lts"
python = "latest"
```

更改当前项目使用的运行时版本

```sh
# 当前项目使用 nodejs 的 20 版本
mise use node@20
```

这会在当前目录下创建 `mise.toml` 文件，并添加如下信息

```toml
[tools]
node = "20"
```

如果激活了 Mise，则只要处于这个项目中，Mise 就会自动使用这个运行时的版本。

### 高级设置

如果希望 Mise 能够支持 `.nvmrc`、`.python-version` 等文件，需要添加一些设置。这样当你和别人协作时，如果别人的项目里有这些文件，你不需要安装对应的工具，也不需要在项目里添加 `mise.toml`，就可以和别人的体验一样，实现无缝的工具替换。

```sh
# 让 mise 能够支持 .python-version 等文件
mise settings add idiomatic_version_file_enable_tools python
# 让 mise 能够支持 .nvmrc 等文件
mise settings add idiomatic_version_file_enable_tools node
```

对于 Python，如果希望 mise 和 uv 配合体验更好的话，那么可以添加一些设置

```sh
# 让 mise 自动激活 uv 创建的虚拟环境
python.uv_venv_auto
```
