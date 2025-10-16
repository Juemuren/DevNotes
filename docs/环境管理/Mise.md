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

我使用 Mise 的次数不多，去看官方文档吧。

- [开发工具](https://mise.jdx.dev/dev-tools/)
- [环境变量](https://mise.jdx.dev/environments/)
- [任务](https://mise.jdx.dev/tasks/)
