# Fd

## 简介

fd 是个文件查找器，功能和 `find` 类似，但使用起来更友好

## 安装

```sh
# Windows
scoop install fd
```

## 示例

fd 的特点就是用法简单，比起 `find` 要好写、好理解。由于 fd 的用法非常多，我无法一一介绍，就举几个我自己实际使用 fd 的场景。

---

我有一个用 LaTeX 写的学习笔记，现在想全部迁移到 Markdown，因为后者更适配静态网站生成器。以下命令可以将当前目录下（包括子目录）的所有 tex 文件转为 md 格式，并以展平的结构移动到一个新的目录里

```sh
fd -e tex -x pandoc "{}" -o "{.}.md"
mkdir markdown
fd -e md -x mv "{}" markdown/
```

---

我想统计这个仓库中的所有 markdown 文件加起来有多少字，就可以使用如下命令

```sh
fd -e md -X wc
```

---

我要检查某条 PATH 中是否有 exe 文件或 dll 文件被覆盖，可以运行以下命令

```sh
fd -e exe -e dll -d 1 --search-path "search/path" -x which '{/}' | rg -v -F "search/path"
# Windows 系统需要额外处理后一个路径，比如改为 rg -v -F "$(cygpath 'search/path')"
```
