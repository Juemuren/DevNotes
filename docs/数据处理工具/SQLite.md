# SQLite

## 简介

SQLite 是一个轻量级的关系型数据库，适合在作为命令行工具来处理数据，或作为库嵌入应用程序中

## 对比

相比于那些 `C-S` 架构的数据库，SQLite 有很多不同的地方

- 单文件存储。整个数据库内容都存储在一个文件中
- 零配置。不需要安装、配置数据库服务器，单个程序/库就可以直接使用
- 访问快。直接访问本地文件，不需要进程间通信/网络通信

## 安装

SQLite 作为命令行工具，可以通过系统包管理器安装

```sh
# Windows
scoop install sqlite3
```

SQLite 作为库，可以通过语言包管理器将其集成到应用程序中。大多数语言都有 SQLite 的接口绑定

## 使用

本部分只专注于 SQLite 作为命令行工具的用法，更详细的说明请阅读 [官方文档](https://sqlite.org/docs.html)。

运行 `sqlite3` 就可以进入数据库的交互式界面，这个交互界面可以使用 **点命令** 和 **SQL**。输入 `.help` 就能看到点命令的帮助，输入 `.quit` 可以退出这个界面。

### 基本使用

读取/保存数据文件

```sql
-- 从文件中读取数据
.open example.db
-- 将数据保存为文件
.save new_example.db
-- 查看当前打开的文件
.database
```

查看表信息

```sql
-- 列出所有表
.tables
-- 查看表的模式
.schema users
-- 查看表的索引
.indexes users
```

### 运行 SQL

```sql
-- 创建表
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT
);

-- 插入数据
INSERT INTO users VALUES(1,'Alice','alice@example.com');
INSERT INTO users VALUES(2,'Bob','bob@example.com');

-- 查询数据
SELECT * FROM users;
SELECT email FROM users WHERE name = 'Bob';

-- 修改数据
UPDATE users
SET email = 'new@example.com'
WHERE name = 'Bob';
```

或者不使用交互界面，直接命令行里运行

```sh
# 运行单条 SQL 语句
sqlite3 example.db "SELECT * FROM users;"
# 运行已保存的 SQL 脚本
sqlite3 example.db < query.sql
# pwsh 不支持 < 重定向，用管道替代
cat query.sql | sqlite3 example.db
```

### 转储 SQL

```sql
-- 将整个数据库备份为 SQL
.output example_backup.sql
.dump
.output stdout

-- 从 SQL 中重建数据库
.read example_backup.sql
```

或者不使用交互界面，直接进行备份

```sh
# 将数据备份为 SQL
sqlite3 example.db ".dump" > example_backup.sql
# 从 SQL 中恢复数据
sqlite3 new_example.db < example_backup.sql
# 若 Shell 不支持 < 重定向可使用管道替代
cat example_backup.sql | sqlite3 new_example.db
```

### 处理 CSV

```sql
-- 从 CSV 中导入数据
.mode csv
.import users.csv users

-- 将查询结果保存为 CSV
.mode csv
.once data.csv
SELECT * FROM users;
```

或者不使用交互界面，直接将查询结果保存为 CSV

```sh
sqlite3 -csv example.db "SELECT * FROM users" > output.csv
```

### 处理 JSON

```sql
-- 从 JSON 中导入数据
.mode json
.import users.json users

-- 将查询结果保存为 JSON
.mode json
.once data.json
SELECT * FROM users;
```

或者不使用交互界面，直接将查询结果保存为 JSON

```sh
sqlite3 -json example.db "SELECT * FROM users" > output.json
```

此外 SQLite 还能够处理 Markdown、HTML 等格式的数据，用法都是类似的

## 示例

我想要统计游戏中的芯片数量，以了解该优先刷取哪个副本。首先准备一个 `chips.csv` 文件

```csv
职业,芯片类型,数量
先锋,小,7
先锋,大,9
辅助,小,15
辅助,大,15
狙击,小,13
狙击,大,13
术士,小,8
术士,大,9
近卫,小,10
近卫,大,11
特种,小,8
特种,大,10
重装,小,10
重装,大,11
医疗,小,11
医疗,大,13
```

然后导入 csv 文件。该这些 SQL 语句和操作可以保存在 `chip_import.sql` 文件里，通过 `sqlite3 < chips_import.sql` 来执行

```sql
-- 创建表
CREATE TABLE IF NOT EXISTS chips (
    职业 TEXT NOT NULL,
    芯片类型 TEXT NOT NULL,
    数量 INTEGER NOT NULL,
    UNIQUE(职业, 芯片类型)
);

-- 导入 CSV 数据
.mode csv
.import chips.csv chips
.save chips.db
.quit
```

接着编写查询。这里结合了一些游戏内的逻辑，包括

- 游戏内的副本可能掉落两种芯片，并且这两种芯片之间可以互相转换，因此需要分组进行查询
- 游戏中干员精一需要 5 个小芯片，精二需要 8 个大芯片，因此需要筛选出紧缺的芯片
- 输出降序只是为了方便查看

```sql
-- 查询小芯片统计
SELECT *
FROM chips
WHERE 芯片类型 = '小'
ORDER BY 数量 DESC;

-- 查询大芯片统计
SELECT *
FROM chips
WHERE 芯片类型 = '大'
ORDER BY 数量 DESC;

-- 查询小芯片合并统计
SELECT
    CASE
        WHEN 职业 IN ('先锋', '辅助') THEN '先锋 + 辅助'
        WHEN 职业 IN ('狙击', '术士') THEN '狙击 + 术士'
        WHEN 职业 IN ('近卫', '特种') THEN '近卫 + 特种'
        WHEN 职业 IN ('重装', '医疗') THEN '重装 + 医疗'
    END AS 组合,
    芯片类型,
    SUM(数量) AS 总数
FROM chips
WHERE 芯片类型 = '小'
GROUP BY
    CASE
        WHEN 职业 IN ('先锋', '辅助') THEN '先锋 + 辅助'
        WHEN 职业 IN ('狙击', '术士') THEN '狙击 + 术士'
        WHEN 职业 IN ('近卫', '特种') THEN '近卫 + 特种'
        WHEN 职业 IN ('重装', '医疗') THEN '重装 + 医疗'
    END
ORDER BY 总数 DESC;

-- 查询大芯片合并统计
SELECT
    CASE
        WHEN 职业 IN ('先锋', '辅助') THEN '先锋 + 辅助'
        WHEN 职业 IN ('狙击', '术士') THEN '狙击 + 术士'
        WHEN 职业 IN ('近卫', '特种') THEN '近卫 + 特种'
        WHEN 职业 IN ('重装', '医疗') THEN '重装 + 医疗'
    END AS 组合,
    芯片类型,
    SUM(数量) AS 总数
FROM chips
WHERE 芯片类型 = '大'
GROUP BY
    CASE
        WHEN 职业 IN ('先锋', '辅助') THEN '先锋 + 辅助'
        WHEN 职业 IN ('狙击', '术士') THEN '狙击 + 术士'
        WHEN 职业 IN ('近卫', '特种') THEN '近卫 + 特种'
        WHEN 职业 IN ('重装', '医疗') THEN '重装 + 医疗'
    END
ORDER BY 总数 DESC;

-- 查询紧缺的小芯片
SELECT *
FROM chips
WHERE
    芯片类型 = '小' AND 数量 < 5
ORDER BY 数量 DESC;

-- 查询紧缺的大芯片
SELECT *
FROM chips
WHERE
    芯片类型 = '大' AND 数量 < 8
ORDER BY 数量 DESC;
```

以上 SQL 语句同样可以保存在 `chip_query.sql` 文件里，通过 `sqlite3 chips.db < chips_query.sql` 反复调用。如果不想一次执行这么多查询，也可以分开保存。

虽说目前已经可以通过修改 `chips.csv` 文件然后重新导入 SQLite 来更新数据，但也可以用 SQL 语句。可以用 `sqlite3 chips.db` 打开数据库文件进行交互式更新，也可以把更新封装为一个脚本，然后通过 `./update.sh <职业> <芯片类型> <增减量>` 使用

```sh
#!/bin/bash

DB="chips.db"
JOB="$1"
CHIP_TYPE="$2"
INCREMENT="$3"

if [ $# -ne 3 ]; then
    echo "用法: $0 <职业> <芯片类型> <增减量>"
    echo "示例: $0 重装 小 +1"
    echo "示例: $0 先锋 大 -2"
    exit 1
fi

# 执行更新
sqlite3 "$DB" "UPDATE chips SET 数量 = 数量 $INCREMENT WHERE 职业 = '$JOB' AND 芯片类型 = '$CHIP_TYPE';"

# 显示结果
echo "更新完成: $JOB 的 $CHIP_TYPE 芯片 $INCREMENT"
sqlite3 "$DB" "SELECT * FROM chips WHERE 职业 = '$JOB' AND 芯片类型 = '$CHIP_TYPE';"
```

如果使用 SQL 进行更新，可以再与 `chips.csv` 进行同步

```sh
sqlite3 -csv chips.db "SELECT * FROM chips" > chips.csv
```
