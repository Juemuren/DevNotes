# Go

## 环境搭建

我使用 Mise + VSCode 搭建开发环境

### 获取工具链

```sh
# 使用最新版的 go
mise use -g go@latest
```

### 编辑器集成

VSCode 里有官方插件 [Go](https://marketplace.visualstudio.com/items?itemName=golang.Go)

该插件几乎是开箱即用的，它会自动帮你安装需要的东西

由于使用 mise 安装 go 时不会直接修改本机的 **PATH** 环境变量，因此插件可能找不到 go 编译器。解决方案大概有这几种

- 在 shell 中[激活 Mise](../环境管理器/Mise.md#激活)，然后通过 `code .` 打开项目
- Mise [改为 *Shims* 模式](../环境管理器/Mise.md#激活)
- 换别的方式安装 go 编译器
