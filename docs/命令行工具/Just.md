# Just

## 简介

Just 是一个任务运行器，语法类似 `Make` 但更简单。

## 对比

由于 Just 不是构建系统，所以并不能取代 Make。但对于那些把 Make 当任务运行器用的人，显然换 Just 更合适。毕竟把 Make 当作任务运行器其实是对 Make 的滥用。

Just 是专门用来写脚本任务的工具，因此可以为此进行优化让其更易用。

以下是两个简单的比较示例，均来自我自己的真实使用场景

### 构建任务

我想用 Pandoc + Typst 把 Markdown 转为 PDF，我希望可以只输文件的名字，而不用打很长的命令。

使用 Make 可以这样写，然后使用 `make example.pdf` 生成文件

```makefile
%.pdf: %.md
	pandoc -s $< -o $@ \
		--from markdown \
		--pdf-engine=typst \
		-V mainfont="Microsoft YaHei UI"
```

而 Just 只用这样写，然后使用 `just typst example` 生成文件

```justfile
typst name:
    pandoc -s {{name}}.md -o {{name}}.pdf \
        --from markdown \
        --pdf-engine=typst \
        -V mainfont="Microsoft YaHei UI"
```

对于这种构建任务，Just 其实没有多少优势。毕竟 Make 是个构建系统，它可以自动比较依赖文件和目标文件的修改日期，判断要不要重新构建，而 Just 得借助别的工具来做到这一点。

### 非构建任务

我想用 YOLO CLI 进行一些简单的模型训练任务，并希望能够在命令行里修改主要的参数。

以下是 Just 的版本，使用时只需 `just train coco8 yolo11n 50 8 0.01` 即可

```justfile
# 模型训练
train data model epochs batch lr:
    cd training && \
    yolo train \
        data="{{data}}.yaml" \
        model="{{model}}.pt" \
        epochs={{epochs}} \
        batch={{batch}} \
        lr0={{lr}} \
        project="runs/{{model}}-{{epochs}}-{{batch}}-{{lr}}" \
        name="train"
```

而 Make 的版本如下，使用时需要用 `make train DATA=coco MODEL=yolo11n EPOCHS=50 BATCH=8 LR=0.001` 覆盖掉默认的环境变量

```makefile
DATA ?= data
MODEL ?= model
EPOCHS ?= 100
BATCH ?= 16
LR ?= 0.01

.PHONY: train
train:
	cd training && \
	yolo train \
		data="$(DATA).yaml" \
		model="$(MODEL).pt" \
		epochs=$(EPOCHS) \
		batch=$(BATCH) \
		lr0=$(LR) \
		project="runs/$(MODEL)-$(EPOCHS)-$(BATCH)-$(LR)" \
		name="train"
```

由于模型训练本身不是一个构建任务，我们不关注文件间的依赖关系，所以更适合用 Just。

### 对比总结

我其实并不认同 Just 是现代版 Make 的说法，这是两个用于不同场合的工具。Make 更适合构建任务，Just 更适合非构建任务。当然，这两个工具也可以一起使用：构建任务写在 `Makefile` 里，然后用 `Justfile` 统一管理所有任务。比如对于第一个例子，`Makefile` 保持原样，然后 `Justfile` 可以这样写

```justfile
make-pdf name:
    make {{name}}.pdf
```

然后使用 `just make-pdf example` 来生成 PDF 文件。这样即利用了 Make 作为一个构建系统的功能，又利用了 Just 的很多现代特性来统一管理任务。

## 安装

```sh
# Windows
scoop install just
```

## 特性

这里只列出我常用的几个 Just 特性，[官方文档](https://just.systems/man/en/)里有全部的 Just 特性介绍。

在 Just 中，任务被称作配方，不过我还是更习惯称其为任务。

### [列出配方](https://just.systems/man/en/listing-available-recipes.html)和[文档注释](https://just.systems/man/en/documentation-comments.html)

`just --list` 它可以列出所有任务，并会显示参数以及任务描述，任务描述就是写在任务定义上一行的注释。

### [配方属性](https://just.systems/man/en/attributes.html)

Just 支持给任务定义额外的属性，通过在任务定义的上方写个 `[xxx]` 来使用。
