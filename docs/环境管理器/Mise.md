# Mise

## 简介

Mise 是个用来管理工具链版本和切换环境的工具，也可以充当任务运行器。

## 对比

作为工具链管理器，Mise 可以替代许多工具，比如 `nvm`、`pyenv` 等。这些程序通常只用来管理一个工具的版本，而 Mise 可以管理多种工具的版本。你可以在 [Mise Registry](https://mise.jdx.dev/registry.html#tools) 上查看 Mise 能够管理的所有工具。如果你正在使用多个不同工具的版本管理攻击，那么 Mise 可能非常适合你，它让你不再需要记忆每种工具的用法，只需知道 Mise 怎么用就行了。

作为环境切换工具，Mise 是 `direnv` 的替代品。功能很简单，就是修改 *环境变量* 而已。对于部分工具，比如 Python，Mise 还能自动激活虚拟环境。

作为任务运行器，Mise 通过 `toml` 定义任务，语法和 `Make`、`Just` 差异很大。作为写习惯了 Make 的人，我还是更喜欢 [Just](../命令行工具/Just.md)，它改善了 Make 且语法类似。不过，大多数时候使用 Mise 也很方便。

## 安装

非常适合使用 Scoop 安装

```sh
scoop install mise
```

## 使用

> [!Note]- 官方文档
> Mise 的功能很多，这里无法全面介绍，你可以阅读对应的文档来详细了解。
>
> - [开发工具](https://mise.jdx.dev/dev-tools/)
> - [环境变量](https://mise.jdx.dev/environments/)
> - [任务](https://mise.jdx.dev/tasks/)

### 激活

Mise 的一些功能需要与 Shell 集成（官方说法是激活）后才能使用。你可以阅读[官方文档](https://mise.jdx.dev/getting-started.html#activate-mise)了解如何激活 Mise。

对于 pwsh，需要往 `$PROFILE` 文件中添加如下命令

```pwsh
mise activate pwsh | Out-String | Invoke-Expression
```

Mise 默认通过修改 *PATH* 切换运行时版本。Mise 还有另一种切换运行时版本的方式，就是 *Shims*，它和修改 *PATH* 的方法略有不同，详细的比对你可以参考[这些内容](https://mise.jdx.dev/dev-tools/shims.html#mise-activate-shims)。一般来说，*PATH* 是更推荐的选择。

### 开发工具

Mise 可以用来管理多种编程语言运行时的不同版本，也可以用来管理本地开发工具的不同版本，但需要借助插件。

你可以在[官方文档](https://mise.jdx.dev/core-tools.html#core-tools)里看到目前 Mise 能够管理的语言运行时，而其余的开发工具可以在[这里](https://mise.jdx.dev/registry.html#tools)找到。

Mise 会自动更新 *PATH* 或 *Shims* 以确保你使用了正确的版本，不过该功能需要激活。

由于我主要使用 Mise 管理语言运行时的不同版本，因此后文只介绍这种用法。

#### 基本使用

Mise 可以更改全局使用的运行时版本

```sh
# 全局使用 python latest
mise use -g python
# 全局使用 nodejs lts
mise use -g node@lts
# 全局使用 java 17
mise use -g java@17
```

这会修改 `~/.config/mise/config.toml` 文件，添加类似这样的信息

```toml
[tools]
java = "17"
node = "lts"
python = "latest"
```

也可以更改当前项目使用的运行时版本

```sh
# 当前项目使用 nodejs 20
mise use node@20
```

这会在当前目录下创建 `mise.toml` 文件，并添加如下信息

```toml
[tools]
node = "20"
```

如果激活了 Mise，则只要处于这个项目中，Mise 就会自动使用这个运行时的版本。

#### 高级设置

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
mise add settings python.uv_venv_auto true
```

### 环境变量

mise 会自动在当前 shell 会话中设置环境变量，这个功能同样需要激活。

```sh
# 进入当前项目后自动设置
mise set NODE_ENV=production
```

这会在 `mise.toml` 中添加如下内容

```toml
[env]
NODE_ENV = "production"
```

有一些环境变量比较特殊，比如 `_.python.venv`。若将其设置为虚拟环境的路径，mise 就会在进入项目目录后自动激活虚拟环境，不过这样似乎无法通过 `deactivate` 退出虚拟环境了 `:(`

```toml
[env]
_.python.venv = "venv" # 这是虚拟环境的相对路径
```

你可以在[这里](https://mise.jdx.dev/environments/#env-directives)找到更多的特殊环境变量

### 任务

可以通过 `mise tasks add build -- mkdocs build` 设置任务，这会在 `mise.toml` 中添加如下内容

```toml
[tasks.build]
run = "mkdocs build"
```

当然也可以直接在该文件里手写任务，并且可以单独设置环境变量、添加描述信息等，如下所示

```toml
[tasks.build]
description = "Build the website" # 添加描述信息
env = { "MY_VAR" = "my variable" } # 添加环境变量
run = "mkdocs build"
```

`mise run build` 就可以运行 build 任务，`mise tasks ls` 会显示所有的任务，以及对应的描述信息
