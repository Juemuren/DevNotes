# Python

## 环境搭建

目前我使用 Miniforge + VSCode 搭建开发环境，Miniforge 用于获取工具，而 VSCode 用于编辑代码。

我有时也使用别的方法获取工具，比如 mise/uv。

不是很推荐直接安装 Python，因为这样没办法管理运行时的版本。

### 安装工具链

#### Miniforge

如果使用 Miniforge 获取工具链，请先完成 [Miniforge 的安装](../环境管理器/Conda.md)，然后通过如下命令安装解释器和第三方库

```sh
# 选定一个解释器的版本
mamba create -n ml python=3.13
# 激活环境
mamba activate ml
# 安装一些第三方库
mamba install ipykernel numpy matplotlib scikit-learn pandas
```

#### mise/uv

如果使用 mise/uv 或类似的工具来获取管理 Python 的运行时版本，则首先应该安装这些工具

- [安装 Mise](../环境管理器/Mise.md#安装)
- [安装 uv](../包管理器/Uv.md#安装)

对于 mise + uv 这一组合，你还应该进行一些设置使二者配合起来更舒适

```sh
# 让 mise 能够支持 .python-version 等文件
mise settings add idiomatic_version_file_enable_tools python
# 让 mise 自动激活 uv 创建的虚拟环境
mise add settings python.uv_venv_auto true
# 禁用 uv 自动下载 python 的功能
echo 'python-downloads = "never"' >> "$env:APPDATA\uv\uv.toml"
```

然后，可以运行如下命令，新建目录并安装相应的依赖

```sh
# 新建一个使用 python 3.13 的项目
uv init example --python 3.13
# 进入项目
cd example
# 此时如果 mise 警告缺失版本，则手动安装对应的 python
mise install python@3.13
# 运行测试代码，同时会自动创建虚拟环境和锁文件
uv run main.py
# 为项目添加依赖
uv add numpy
```

### 编辑器集成

> [!Note]+ 官方文档
> 后面的示例以 *Miniforge* 为例，使用 **mise**/**uv** 获取工具的话，集成方法应该是差不多的。
>
> 你也可以参考官方文档 [VSCode Python](https://code.visualstudio.com/docs/python/python-quick-start)

#### 使用解释器

需要安装插件 [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)

新建一个 `test.py` 文件，输入 VSCode 命令 `Python: Select Interpreter`，VSCode 会识别到不同的 conda 环境，请选择正确的那个解释器

> [!Tip]- 无法识别 Conda 环境
> 如果 VSCode 没有识别到 conda 环境的话，你可以参考 [Conda 编辑器集成](../环境管理器/Conda.md#编辑器集成) 来解决

之后就可以在 `.py` 文件的右上角找到运行按钮，此时 VSCode 会调用刚选择的解释器

#### 使用调试器

需要安装插件 [Python Debugger](https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy)

输入 VSCode 命令 `Debug: Add Configuration`，选择 `Python Debugger` 插件自动生成的配置。

自动生成了 `launch.json` 文件后，就可以直接点击按钮来调试了。

#### 使用编程笔记本

需要安装插件 [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)

如果需要使用编程笔记本，请确保已经安装了 `ipykernel`。你可以通过 `mamba list` 或 `pip list` 查看是否已经安装。

新建一个 `test.ipynb` 文件，输入 VSCode 命令 `Jupyter: Select Interpreter to Start Jupyter Server`，选择一个合适的内核，然后就可以使用编程笔记本了。

## 命令行工具

### 包管理器

- pip 官方标准
- [uv](../包管理器/Uv.md) 用 Rust 写的，目前应该是最快的包管理器，但功能不只包管理，还包括了运行时管理等功能。
- [conda](../环境管理器/Conda.md) 我认为其职能已经超越了传统的包管理器。[官网](https://anaconda.org/anaconda/conda)的介绍是**包管理系统和环境管理系统**，因此我把它放在了 *环境管理* 章节中。

### 格式化

- ruff

### 性能分析

- snakeviz

### 打包器

- PyInstaller

## 库和框架

Python 由于标准库已经非常强大了，并且大多第三方库都是用于特定应用的（已移到专门的章节中），因此这里列出的框架/库会比较少。

### 通用库

- requests 网络请求库
- psutil 用于系统监控的库，提供了和 `ps`、`top`、`iotop`、`lsof`、`netstat`、`ifconfig`、`free` 等命令类似的功能
