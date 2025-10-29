# Fd

[官网](https://github.com/sharkdp/fd)

## 简介

fd 是个文件查找器，功能和 `find` 类似，但使用起来更友好

## 安装

非常适合使用 Scoop 安装

```sh
scoop install fd
```

## 使用

比如我有一个用 LaTeX 写的学习笔记，现在想全部迁移到 Markdown，因为后者更适配静态网站生成器。我只需要简单的 *3* 条命令，就可以将目录下（包括子目录）的所有 tex 文件转为 md 格式，并且移动到一个新的目录里。语法非常简洁，比起 `find` 要好写、好理解很多。

```sh
fd -e tex -x sh -c 'pandoc "{}" -o "{.}.md"'
mkdir markdown
fd -e md -x sh -c 'mv "{}" markdown/'
```
