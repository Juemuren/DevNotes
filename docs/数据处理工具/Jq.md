# Jq

## 简介

jq 是一个命令行 JSON 处理器

## 安装

```sh
# Windows
scoop install jq
```

## 使用

jq 使用路径访问 JSON 中的字段，并且可以一直嵌套下去

- `.` 表示整个文件
- `.attr` 如果是对象，表示对象的 attr 字段
- `.[]` 如果是数组，表示数组的所有元素
- `.[1]` 如果是数组，表示数组第 2 个索引的元素
- `.attr.value` 表示 attr 字段的 value 字段

jq 有自己的语言（就像 `awk` 那样），详细说明请阅读[官方文档](https://jqlang.org/manual/)。

### 查询

```sh
# 输出 114514
echo '{ "num1": 114514, "num2": 1919180 }' | jq '.num1'
# 输出 1919180
echo '[ 114514, 1919180 ]' | jq '.[1]'
```

### 修改

```sh
# 输出 { "num1": 123456, "num2": 1919180 }
echo '{ "num1": 114514, "num2": 1919180 }' | jq '.num1 = 123456'
# 将输出写入新文件
cat old.json | jq '.key = "value"' > new.json
```

### 脚本

```sh
# 运行 script.jq 中的查询/修改
cat old.json | jq -f script.jq
```
