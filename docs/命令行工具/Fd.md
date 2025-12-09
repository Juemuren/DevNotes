# Fd

## 简介

fd 是个文件查找器，功能和 `find` 类似，但使用起来更友好

## 安装

```sh
# Windows
scoop install fd
```

## 使用

fd 的特点就是用法简单，比起 `find` 要好写、好理解。由于 fd 可选的参数数量非常多，我无法一一介绍，就举几个我自己实际使用 fd 的场景。

比如我有一个用 LaTeX 写的学习笔记，现在想全部迁移到 Markdown，因为后者更适配静态网站生成器。我只需要简单的几行命令，就可以将目录下（包括子目录）的所有 tex 文件转为 md 格式，并以展平的结构移动到一个新的目录里

```sh
fd -e tex -x pandoc "{}" -o "{.}.md"
mkdir markdown
fd -e md -x mv "{}" markdown/
```

再比如我想统计这个仓库中的所有 markdown 文件加起来有多少字，就可以运行

```sh
fd -e md -X wc
```
