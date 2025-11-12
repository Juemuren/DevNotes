# Uv

## 简介

uv 是一个 python 的 *包管理* 和 *项目管理器*。然而这只是官方说法，实际上 uv 的功能更多，比如 *工具管理*、*运行时管理* 等功能 uv 也是有的

uv 自称是可以替代 `pip`, `pip-tools`, `pipx`, `poetry`, `pyenv`, `twine`, `virtualenv` 以及更多的工具的单一工具。这回倒是不谦虚了，不过这确实是对的。

并且由于 uv 使用 Rust 实现，所以速度很快。

## 安装

Windows 上非常适合使用 Scoop 安装

```sh
scoop install uv
```

## 使用

### 项目管理

uv 自称项目管理器，因此有项目管理的功能

```pwsh
# 新建项目
uv init example
# 可以指定 python 版本
uv init example --python 3.13
# 进入项目
cd example
# 在项目环境中运行脚本或命令，不需要先激活环境
uv run main.py
uv run -- mkdocs serve
# 更新锁文件
uv lock
# 同步项目环境，即一键往虚拟环境里安装所有的依赖
uv sync
```

`uv run`、`uv lock`、`uv sync` 等命令都会自动创建虚拟环境，也可以通过 `uv venv` 手动创建。`.python-version` 中的 python 版本会用来创建虚拟环境，因此在创建环境前需要注意一下。

uv 在 `.venv` 目录中存放虚拟环境，有 `uv.lock` 作为锁文件，`pyproject.toml` 作为项目文件。这些都让 uv 有了强大的项目管理功能

### 包管理

同时 uv 还自称包管理器，因此也有包管理的功能

这种包管理通常会和项目管理结合，用来处理项目的依赖

```sh
# 添加依赖
uv add mkdocs
# 移除依赖
uv remove mkdocs
# 查看依赖树
uv tree
```

### 工具管理

uv 还可以安装和运行工具

```sh
uvx ruff
# 等效的命令
uv tool run ruff
```

uvx 会把工具安装到临时的隔离环境中。如果需要把工具添加为项目依赖，应该使用 `uv run`

### 运行时管理

uv 还有管理运行时版本的功能

```pwsh
# 下载 python 3.12
uv python install 3.12
# 固定项目使用的版本为 3.12
uv python pin 3.12
```

默认情况下，uv 会在缺失 python 版本时自动尝试下载。我个人更喜欢使用专门的**运行时版本管理器**来做这件事，比如 [mise](../环境管理器/Mise.md)。可以往配置文件中添加如下内容禁用这个特性

```toml
python-downloads = "never" # 永远不会下载
python-downloads = "manual" # 只能通过 uv python install 来下载
```

在 Windows 上，这个配置文件的位置比较诡异，放在了 `$env:APPDATA\uv\uv.toml`；而 macOS 和 Linux 一般都是 `~/.config/uv/uv.toml`
