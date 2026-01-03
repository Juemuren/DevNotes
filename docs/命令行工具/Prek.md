# Prek

## 简介

Prek 是用 Rust 重写的 pre-commit，而后者是一个用 Python 写的[提交前钩子](Git.md#钩子)框架

## 安装

```sh
# Windows
scoop install prek
```

## 使用

详细用法请参考[官方文档](https://prek.j178.dev/)

首先创建一个配置文件 `.pre-commit-config.yaml`。这个配置文件使用了 [pre-commit 仓库](https://github.com/pre-commit/pre-commit-hooks)中的 `check-yaml` 和 `end-of-file-fixer` 钩子

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v6.0.0
    hooks:
      - id: check-yaml
      - id: end-of-file-fixer
```

然后可以使用 `prek run` 运行这些钩子。当然最好的方式是将钩子集成到 Git 中，这样每次提交前就会自动运行这些钩子。

```sh
# 将钩子集成到 Git 中
prek install
# 从 Git 中删除钩子
prek uninstall
```
