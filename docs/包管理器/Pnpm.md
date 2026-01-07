# Pnpm

## 简介

Pnpm 是一个 JavaScript 的包管理器

## 对比

pnpm 的 [开发动机](https://pnpm.io/motivation) 以及与 yarn/npm 的 [特性对比](https://pnpm.io/feature-comparison)

简单地说，pnpm 尝试通过符号链接的方式解决 npm 的一些痛点，如 **占用过多磁盘空间**、**安装过程很慢** 等。

## 安装

```sh
# Windows
scoop install pnpm
```

## 使用

[官方文档](https://pnpm.io/pnpm-cli)

pnpm 的用法和 npm 非常类似

```sh
# 初始化 package.json 文件
pnpm init
# 通过 create-xxx 创建项目
pnpm create vite@latest
# 添加依赖
pnpm add react
# 移除依赖
pnpm remove react
# 更新依赖
pnpm update react
# 安装所有依赖
pnpm install
# 列出所有依赖
pnpm list
# 运行 package.json 中定义的命令
pnpm run dev
```
