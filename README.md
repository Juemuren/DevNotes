# 编程笔记

分享一些我的关于**环境配置**和**工具使用**的经验。

我最常用的平台是 `Windows`，因此教程大多以此为示例。

## 目录

目前已完成的教程有
  - [YOLO](./docs/YOLO.md)
  - [MSYS](./docs/MSYS.md)
  - [Vcpkg](./docs/Vcpkg.md)
  - [Conda](./docs/Conda.md)

部分完成的教程有
  - [VSCode](./docs/VSCode.md)
  - [CLI](./docs/CLI.md)

未来计划写的教程有
  - WSL
  - Python
  - Cpp

## 导出 PDF

对于有需求导出 **PDF** 的人，可以在根目录运行

```sh
just pdf NAME
```

来将 `NAME.md` 导出为 `NAME.pdf`。

该方法要求安装
  - `just`
  - `pandoc`
  - `weasyprint`

当然你可以使用你喜欢的方式来导出。

> [!NOTE]
> 目前的导出方法 `weasyprint` 会产生警告。
> 因为存在不兼容的 `css` 属性，也许我需要找个时间修改 `css` 文件。
> 
> 目前使用的 `css` 和 `theme` 文件都来自 [markdown-css-for-pandoc](https://github.com/wklchris/markdown-css-for-pandoc)，我仅做了少量修改。