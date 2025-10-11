# Doxygen

[官方文档](https://doxygen.cn/manual/index.html)

## 简介

Doxygen 是一个从源代码自动生成文档的工具，一般只用于 C/C++ 项目

## 安装

我在 Windows 上使用 Scoop 安装

```sh
scoop install doxygen
```

## 使用

Doxygen 的原理很简单，它会读取你提供的源代码文件，获取每个函数、类的相关信息，并且按照约定好的注释块格式获取各参数的含义、返回值的含义、类的成员的含义等，然后生成文档。生成的文档包括 HTML、PDF 等格式，也可以自动生成类图、调用图，但需要额外安装 Graphviz。

Doxygen 支持的语言非常多。默认就能够支持 C、C++、Lex、C#、Objective-C、IDL、Java、PHP、Python、Fortran、D 以及 VHDL，并且可以通过一些配置来支持别的语言。虽然如此，但别的语言大多都有官方工具来实现这个功能，大概率体验更好。企鹅各语言社区早已习惯遵守官方文档生成工具的注释风格，Doxygen 的格式约定可能在别的语言看来有点奇怪。因此大多数用来快速生成 Doxygen 注释块的编辑器插件也都懒得给其他语言做适配了，所有人都默认 Doxygen 就是用于  C/C++ 项目的。

### 注释约定

如果使用 VSCode，我建议可以下载插件 [Doxygen Documentation Generator](https://marketplace.visualstudio.com/items?itemName=cschlosser.doxdocgen)。这个插件可以快速生成 Doxygen 支持的注释块。不过，如前所述，只支持 C/C++。

Doxygen 支持多种风格的注释块，你可以去[官方文档](https://doxygen.cn/manual/docblocks.html#specialblock)中查看更多示例。我这里只列出我个人比较喜欢的注释块风格

#### 函数

```cpp
/**
 * @brief 整数加法
 * 
 * @param a 一个整数
 * @param b 另一个整数
 * @return int 两数之和
 */
int add(int a, int b);
```

#### 类

```cpp
/**
 * @brief 车辆基类
 * 
 * 这是一个抽象基类，定义了车辆的基本接口。
 */
class Vehicle {
public:
    /**
     * @brief 启动车辆
     * 
     * @return true 启动成功
     * @return false 启动失败
     */
    virtual bool start() = 0;
    
    /**
     * @brief 停止车辆
     * 
     */
    virtual void stop() = 0;
    
protected:
    int speed;  ///< 当前速度
};

/**
 * @brief 汽车类
 * 
 * 继承自 Vehicle，实现了汽车的具体功能。
 * @see Vehicle
 */
class Car : public Vehicle {
public:
    // 省略
    bool start() override;
    // 省略
    void stop() override;
    
private:
    int doorCount;  ///< 车门数量
};
```

### 配置文件

首先生成配置文件

```sh
doxygen -g
```

然后调整配置文件。配置文件非常长，但大多都是说明。以下是一些可能有用的选项

```ini
# 源代码目录
INPUT = src
# 记录所有类和函数，即使没写注释块
EXTRACT_ALL = YES
# 私有成员也会被写入文档
EXTRACT_PRIVATE = YES
```

如果想要生成类图、调用图，这些选项可能有用

```ini
# 使用 DOT 生成图片
HAVE_DOT = YES
# 启用类图
CLASS_GRAPH = YES
# 启用调用依赖图
CALL_GRAPH = YES
# 启用调用者依赖图
CALLER_GRAPH = YES
```

### 生成文档

配置文件处理完成后就可以生成文档了

```sh
doxygen
```

#### PDF

PDF 需要用 LaTeX 编译。

```sh
cd latex
make
```

文档是中文的话会比较麻烦，改为 `LATEX_CMD?=lualatex` 后至少不会报错了，但中文仍然不会正确显示。

#### HTML

通常直接浏览器打开 `index.html` 就行。

如果遇到 CORS 导致的样式错误，可以运行 `python -m http.server` 启动本地的 http 服务器，或者先 `npm install -g http-server` 然后运行 `http-server` 来启动本地服务器。
