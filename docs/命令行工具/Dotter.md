# Dotter

## 简介

dotter 是一个用 Rust 编写的点文件管理器

## 对比

在点文件管理器中，更权威的应该是 `chezmoi` 这个工具

我个人感觉 chezmoi 更全能，但 dotter 相对更易用

chezmoi 官方文档里有[与各种点文件管理器的比较](https://www.chezmoi.io/comparison-table/)，不过缺少了 dotter，可能是因为后者比较新

## 安装

```sh
# Windows
scoop install dotter
```

## 使用

请参考[官方文档](https://github.com/SuperCuber/dotter/wiki/1.-Getting-Started)

### 初始化仓库

```sh
# 先创建目录
mkdir dotfiles
cd dotfiles
# 初始化
dotter init
```

然后往 `.gitignore` 里写入如下内容

```ignore
.dotter/local.toml
.dotter/cache.toml
.dotter/cache
```

### 迁移点文件

首先把想要管理的文件复制过来，可以改个更好记的名字

```sh
cp ~/.vimrc vimrc.vim
```

然后修改 `.dotter/global.toml` 中的 `[default.files]`。等号前面是当前仓库里的相对路径，后面是要存放的位置

```toml
[helpers]

[default]
depends = []

[default.files]
"vimrc.vim" = "~/.vimrc"
"fastfetch/fastfetch.jsonc" = "~/.config/fastfetch/config.jsonc"
```

### 创建符号链接

上述任务完成后就可以开始创建符号链接了

```sh
# 只查看运行结果，不实际修改
dotter deploy --dry-run -f
# 删除原文件，创建符号链接，并显示详细日志
dotter deploy -v -f
```

`-f` 参数会把原位置存在的文件删除后再创建符号链接。

### 备份和同步

为了能够备份和同步，你应该把这个仓库上传到云端进行存储，比如 Github。可以设成私有的，毕竟只有自己用

在新机器上要同步点文件，首先得把 `git` 和 `dotter` 安装了

然后按如下步骤操作

```sh
git clone https://github.com/xxxxxxx/dotfiles
cd dotfiles
dotter deploy -v -f
```
