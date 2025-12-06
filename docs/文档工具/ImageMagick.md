# ImageMagick

## 简介

ImageMagick 用于编辑和处理数字图像。它可用于创建、编辑、合成或转换位图图像，并支持多种文件格式，包括 JPEG、PNG、GIF、TIFF 和 Ultra HDR。

## 对比

ImageMagick 还有另一个分支叫 GraphicsMagick，后者更注重速度、稳定和易用，而前者则拥有更多高级功能

另一个我常用的图片处理工具是 chafa，功能比 ImageMagick 要少

## 安装

```sh
# Windows
scoop install imagemagick
scoop install chafa
```

## 使用

### 使用 imagemagick

我比较少使用这个工具，建议阅读 [ImageMagick 官方文档](https://imagemagick.org/script/command-line-processing.php) 和 [GraphicsMagick 官方文档](http://www.graphicsmagick.org/utilities.html)

### 使用 chafa

[官方手册页](https://hpjansson.org/chafa/man/)

我使用 chafa 主要是为了制作 ANSI 艺术

```sh
# 直接在终端显示图片
chafa example.png
# 将图片转为 ASCII 艺术
chafa -f symbols --symbols braille -c none example.jpg > example.txt
# 将图片转为 ANSI 艺术
chafa -f symbols --symbols braille --fg-only example.jpg > example.txt
# 尝试一下别的符号集合
chafa -f symbols example.jpg > example.txt
```
