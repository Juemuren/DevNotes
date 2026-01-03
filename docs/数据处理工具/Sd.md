# Sd

## 简介

sd 是一个正则查找和替换的工具，可以视为现代版的 `sed`

## 安装

```sh
# Windows
scoop install sd
```

## 使用

sd 的用法很简单

```sh
# 将 files 中匹配 query 的文本替换为 replace
sd <query> <replace> <files>
```

另外有几个常用的参数

- `-p` 预览结果，不实际修改
- `-F` 不使用正则表达式，将其理解为字面量
