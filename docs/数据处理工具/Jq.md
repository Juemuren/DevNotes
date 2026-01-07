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

jq 有自己的语言（就像 `awk` 那样），支持函数等高级编程特性，详细说明请阅读 [官方文档](https://jqlang.org/manual/)。

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
cat data.json | jq -f script.jq
```

## 示例

jq 处理 JSON 数据要比传统的 `awk`/`sed` 方便许多。下面展示一些我自己实际使用 jq 的场景。

---

我想要知道 Scoop 的某个包有哪些二进制文件，会不会和 `PATH` 中已存在的程序冲突。这时可以直接查询 manifest 文件

```sh
scoop cat xxxx | jq '.bin.[]'
# 如果输出有路径前缀，进行去除
scoop cat coreutils | jq '.bin.[] | sub(".*\\\\"; null)'
# 如果输出混合了多种类型，进行筛选和预处理
scoop cat unxutils | jq '.bin.[] | strings | sub(".*\\\\"; null)'
scoop cat uutils-coreutils | jq '.bin[] | arrays | last'
# 得到纯净的输出后就可以开始后续处理了
scoop cat xxx | jq '...' | tr -d '\r' | xargs which
```

---

我要为 MAA 准备搓玉/不搓玉、卖玉/不卖玉共 4 份基建配置，但其实这些配置只有几处不同。此时可以选一个配置作为基准来衍生出别的配置。这样修改就能用简单的脚本进行同步，避免遗漏而导致的错误。

首先编写转换脚本

```jq
# convert-to-both.jq
# 将 不搓玉/不卖玉 转换为 搓玉/卖玉

def update_description:
  .description = "搓玉/卖玉";

def update_manufacture($index; $operators):
  .rooms.manufacture[$index].product = "Originium Shard" |
  .rooms.manufacture[$index].operators = $operators;

def update_trading($index):
  .rooms.trading[$index].product = "Orundum";

update_description |

.plans |= map(
  update_description |
  if .name == "早班" then
    update_manufacture(0; ["艾雅法拉", "地灵", "炎熔"]) |
    update_trading(0)
  elif .name == "晚班" then
    update_manufacture(0; ["火神", "泡泡", "褐果"]) |
    update_trading(0)
  end
)
```

然后执行转换

```sh
jq -f convert-to-both.jq my-243-2-normal.json > my-243-2-both.json
```
