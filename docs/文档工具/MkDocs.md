# MkDocs

## 简介

mkdocs 是个静态网站生成器，用 Python 实现

## 对比

静态网站生成器有非常多，MkDocs 算是其中比较知名的一个，主要优缺点有

  1. 优点
    - 有个好看的主题 `Material for MkDocs`
    - 配置文件选择使用 **YAML**，比较易读
    - 用的人多，插件就会多，相关的资料也比较多
  2. 缺点
    - 由于使用 Python 实现，所以构建速度比较慢。如果你对构建速度要求比较严苛，建议换别的 SSG，比如用 *Go* 写的 [Hugo](Hugo.md)
    - 看久了有点腻 ~~感觉 **VitePress** 的样式更符合我的审美~~

## 安装

先创建一个虚拟环境并激活

```sh
# 比如使用 venv
python -m venv venv
./venv/Scripts/Activate.ps1 # pwsh
source ./venv/Scripts/activate # bash
```

然后通过 pip 安装

```sh
# 安装 mkdocs
pip install mkdocs
# 以及一些主题、插件等
pip install mkdocs-material mkdocs-callouts
```

当然，更好的做法是把所有依赖统一写在 `requirements.txt` 里。每一项后面都可以用 `xxx=11.1` 来指定版本，此处并没有展示

```txt
mkdocs
mkdocs-material
mkdocs-callouts
mkdocs-minify-plugin
mkdocs-open-in-new-tab
mkdocs-git-revision-date-plugin
```

然后直接在虚拟环境中运行 `pip install -r requirements.txt` 就可以安装所有依赖了

## 配置

MkDocs 的配置文件为根目录的 `mkdocs.yml`

本网站就是使用 `MkDocs` 生成的，可以参考 [我的配置文件](https://github.com/Juemuren/DevNotes/blob/main/mkdocs.yml)

[Material for MkDocs 官方文档](https://squidfunk.github.io/mkdocs-material) 中有更详细的说明

> [!Tip]+ VSCode 的 YAML 报错
> 如果你在使用 VSCode 的 [YAML](https://marketplace.visualstudio.com/items?itemName=redhat.vscode-yaml) 插件，那么该插件可能会在 `mkdocs.yml` 文件配置正确时报错。[官方文档](https://squidfunk.github.io/mkdocs-material/creating-your-site/#minimal-configuration-visual-studio-code) 中有说明应该如何修改 YAML 插件的设置以消除误报错。

## 使用

### 本地构建

我平时就只会用到 MkDocs 的几个命令

```sh
# 构建网站
mkdocs build
# 构建并启动开发服务器
mkdocs serve
```

### 持续集成

MkDocs 有个部署到 **Github Pages** 的命令 `mkdocs gh-deploy --force`，你可以据此进行持续集成。具体集成方法可参考 [我的配置文件](https://github.com/Juemuren/DevNotes/blob/main/.github/workflows/ci.yml)。[Github Actions 官方文档](https://docs.github.com/en/actions) 里有更详细的使用说明
