# Rust

## 环境搭建

我使用 Rustup + VSCode 搭建开发环境

### 获取工具链

rustup 是 Rust 官方的工具，提供了管理工具链版本的功能。

可以通过 Scoop 安装 rustup

> [!Note]- Scoop 的 rustup
> 使用 Scoop 安装 rustup 时会下载 MSVC ABI 的 Rust 编译器作为默认编译器。`rustup` 事实上可以在安装时不下载任何编译器，然后用户需要手动安装编译器。Scoop 的 *main bucket* 里有 **3** 个 rustup，分别名为 `rustup`、`rustup-msvc`、`rustup-gnu`，但 `rustup` 和 `rustup-msvc` 行为基本上一模一样。说实话我不太能理解这种行为，`rustup` 应该设计为安装时不下载任何编译器的。

```sh
scoop install rustup
```

然后通过 rustup 获取工具链

```sh
# GNU ABI
rustup toolchain install stable-gnu
# MSVC ABI
rustup toolchain install stable-msvc
# 更改默认工具链
rustup default stable-msvc
```

### 编辑器集成

VSCode 上有 Rust 官方插件 [rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)

该插件几乎是开箱即用的。不需要进行额外的设置，下载后就可以直接使用了。
