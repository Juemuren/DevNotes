# Julia

## 环境搭建

我使用 Juliaup + VSCode 搭建开发环境。Juliaup 用于管理运行时版本，有时我也会用 Miniforge。

### 获取工具链

首先安装 Juliaup

```sh
scoop install juliaup
```

然后运行 `julia` 就会自动安装最新的稳定版解释器

或者使用 Miniforge 获取解释器

```sh
# 安装最新版解释器
mamba install julia
# 安装特定版本的解释器
mamba install julia==1.10.4
```

### 编辑器集成

VSCode 上有 Julia 官方插件 [Julia](https://marketplace.visualstudio.com/items?itemName=julialang.language-julia)

该插件几乎是开箱即用的。不需要进行额外的设置，下载后就可以直接使用了。
