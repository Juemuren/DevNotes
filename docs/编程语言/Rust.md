# Rust

## 环境搭建

我使用 Rustup + VSCode 搭建开发环境。Rustup 用于管理工具链版本。

### 获取工具链

首先安装 Rustup

```sh
# Windows
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
