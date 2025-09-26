# Python

## 环境搭建

目前我使用 Miniforge + VSCode 搭建开发环境

### 安装工具链

请先完成 [Conda 的配置](../环境管理/Conda.md)

通过如下命令安装解释器和第三方库

```sh
# 选一个解释器的版本
mamba create -n ml python=3.13.5
# 选一些第三方库
mamba install ipykernel numpy matplotlib scikit-learn pandas
```

### 编辑器集成

[VSCode 官方文档](https://code.visualstudio.com/docs/python/python-quick-start)

需要安装以下插件

- [Python](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
- [Python Debugger](https://marketplace.visualstudio.com/items?itemName=ms-python.debugpy)
- [Jupyter](https://marketplace.visualstudio.com/items?itemName=ms-toolsai.jupyter)

#### 使用解释器

新建一个 `test.py` 文件

输入 VSCode 命令 `Python: Select Interpreter`，选择一个合适的解释器。

现在可以直接点击按钮来运行了。

#### 使用调试器

输入 VSCode 命令 `Debug: Add Configuration`，选择 `Python Debugger` 插件自动生成的配置。

自动生成的 `launch.json` 文件大概长这样

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python 调试程序: 当前文件",
            "type": "debugpy",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal"
        }
    ]
}
```

现在可以直接点击按钮来调试了。

#### 使用编程笔记本

新建一个 `test.ipynb` 文件

输入 VSCode 命令  `Jupyter: Select Interpreter to Start Jupyter Server`，选择一个合适的内核。

现在可以使用编程笔记本了。

有关 Python 开发的更多技巧可以参考 [Python](../编程语言/Python.md)

## 命令行工具

### 包管理器

- pip 官方标准
- conda 我认为其职能已经超越了传统的包管理器。[官网](https://anaconda.org/anaconda/conda)的介绍是**包管理系统和环境管理系统**，因此我把它放在了[环境管理](../环境管理/index.md)章节中。

## 库和框架

一些我使用过的库和框架

### 性能分析

- snakeviz

### 科学计算

- numpy
- sympy
- scipy

### 绘图

- matplotlib

### 数据分析

- networkx
- pandas

### 信号与系统

- control

### 机器学习

- scikit-learn
- tensorflow
- pytorch
- [YOLO](../开发框架/YOLO.md)

### 编程笔记本

- ipykernel 内核
- jupyterlab 界面
- nbconvert 导出

### Web 后端

- FastAPI
