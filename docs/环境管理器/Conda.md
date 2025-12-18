# Conda

[Miniforge 仓库](https://github.com/conda-forge/miniforge)

## 对比

[Miniforge 对比其它项目](https://conda-forge.org/docs/user/introduction/)

*Miniforge* 相比 *Anaconda* 有一些区别。个人更推荐使用前者

  1. 优势
    - 默认提供了更快速的包管理器 `mamba`，兼容所有常用的 `conda` 命令。当然 `conda` 在 *Miniforge* 里也是可用的
    - 默认使用 `conda-forge` 渠道下载，这是社区维护的包渠道，包数量更多、包更新更及时、平台支持更丰富，且完全不用担心许可协议的问题
    - `base` 环境非常干净，只有包管理程序运行所需的组件
  2. 劣势
    - 默认不安装 `Anaconda Navigator`，无法以可视化的方式使用包管理器

## 安装

### 下载

不建议用 scoop 安装。推荐使用[官方的安装脚本/程序](https://conda-forge.org/download/)。

Windows 版本的安装程序会提供一个图形界面，按照指示安装即可。可以修改安装路径，其余选项使用默认的就行

### 初始化

使用默认选项安装完后应该会有一个快捷方式，按下 `win` 后输入 `miniforge` 就能找到。

打开该快捷方式会启动一个激活了 `base` 环境的 shell，输入以下命令可以初始化 shell，让其能在正常启动的 shell 里执行 `conda` 或 `mamba` 命令

> [!Tip]- 找不到快捷方式
> 如果你没有这个快捷方式，可以输入如下命令初始化 shell，效果是一样的
>
> ```pwsh
> # 将 path\to\miniforge3 替换为你的安装路径
> path\to\miniforge3\condabin\conda.bat init powershell
> path\to\miniforge3\condabin\mamba.bat shell init
> ```

```sh
# conda 初始化 powershell
conda init powershell
# conda 初始化 bash
conda init bash
# mamba 初始化 bash 和 powershell
mamba shell init
```

> [!Warning]- 启动速度
> 所谓初始化 shell，其实就是在 shell 的启动文件中添加了一些命令。
>
> 如前所述，`conda` 由于使用 **Python** 实现，速度非常慢，执行初始化命令要很长时间，会严重拖慢 shell 的启动速度。我在自己的机器上测试，conda 初始化后每次启动 shell 大概要多花费 *2* 秒左右；而 `mamba` 由于用 **C++** 实现，会快很多，大概只花了 *0.2* 秒。因此 `conda` 和 `mamba` 二者只需初始化一个即可，并且最好选择后者，能节省一点时间。

重启 shell 并测试是否成功

```sh
conda --version
mamba --version
```

### 修改设置

```sh
# 禁止自动激活 base
mamba config set auto_activate_base false
# 如果使用了别的 prompt 美化工具，可以禁止 conda 修改 prompt
mamba config set changeps1 false
# 列出包时显示 url
mamba config set show_channel_urls true
```

### 编辑器集成

为了让 VSCode 识别到 Conda 环境，可能需要修改一些编辑器的设置。

打开 VSCode，按下 `ctrl + ,`，然后输入 `conda` 会看到一个叫 `Python: Conda Path` 的设置，在里面填写 conda 可执行文件的路径。你可以在激活了 `base` 环境的 shell 里运行 `where.exe conda` 来获取路径。

或者可以直接修改 VSCode 的 `settings.json` 文件

```json
{
  "python.condaPath": "path\\to\\miniforge3\\condabin\\conda.bat"
}
```

## 使用

后文统一使用 `mamba`。对于常用的命令，`conda` 和 `mamba` 用法几乎完全相同

### 基本使用

```sh
# 列出创建的环境
mamba env list
# 创建名为 example 的新环境，并带有 python 3.12 运行时
mamba create -n example python=3.12
# 激活 example 环境
mamba activate example
# 在激活的环境中安装包
mamba install ipykernel numpy matplotlib pandas
# 在激活的环境中移除包
mamba remove pandas
# 升级 mamba 自身
mamba update -n base -c conda-forge mamba
```
