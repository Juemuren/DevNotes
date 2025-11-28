# Hugo

## 简介

Hugo 是个静态网站生成器，用 Go 实现

## 对比

Hugo 最大的特点是构建速度很快。相比 Mkdocs，Hugo 有很大的不同

- 配置比较麻烦，但同时更灵活。Hugo 通过把别人的整个 **Git** 仓库复制到 `themes` 目录下来使用主题，这样修改起来可能比较麻烦，但也提供了更高的灵活度。
- 不太适合高度结构化的内容。Hugo 相对而言更适合 *博客* 而不是 *书籍*，也就是说你的网站应该由一篇篇联系相对松散的帖子组成，而不是分类清晰、层次鲜明、需要目录的百科。虽然说 Hugo 也有适合 *书籍* 的主题，但对此通常都会选择专门生成文档的 SSG。

由于我的笔记内容是高度结构化的，并且我不太在意构建速度，因此我为这个网站选择了 MkDocs。

## 安装

```sh
# Windows
scoop install hugo-extended
```

## 使用

这个示例来自[官方快速入门教学](https://gohugo.io/getting-started/quick-start/)，不过我换了个主题。官网上可以查看[更多主题](https://themes.gohugo.io/)。

```sh
# 初始化目录并进入
hugo new site quickstart
cd quickstart
# 初始化仓库
git init
# 复制别人的主题并写入配置文件
git submodule add https://github.com/adityatelange/hugo-PaperMod.git themes/PaperMod
echo "theme = 'PaperMod'" >> hugo.toml
# 启动本地服务器
hugo server
# 添加一篇贴文，在编辑器里修改它
hugo new content content/posts/my-first-post.md
# 启动包含草稿的本地服务器
hugo server -D
```
