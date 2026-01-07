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

或者不使用交互界面，直接运行单条 SQL

```sh
sqlite3 example.db "SELECT * FROM users;"
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
sqlite3 -header -csv example.db "SELECT * FROM users" > output.csv
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
