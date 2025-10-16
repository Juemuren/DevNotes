# Just

## 简介

Just 是一个任务运行器，语法类似 `Make` 但更简单。

## 对比

由于 Just 不是构建系统，所以并不能取代 Make。但对于那些把 Make 当任务运行器用的人，显然换 Just 更合适。毕竟把 Make 当作任务运行器其实是对 Make 的滥用。

Just 是专门用来写脚本任务的工具，因此可以为此进行优化让其更易用，比如不需要 Make 里的 `.PHONY`。Just 还可以选择执行脚本的 Shell，因此某种程度上还算是个可以让脚本跨平台运行的工具，当然了，你还是得写出每个 Shell 的脚本。

## 安装

非常适合使用 Scoop 安装

```sh
scoop install just
```

## 使用

我平常经常需要使用一些命令行工具，当命令有点长，但我又不想写 *bash*、*powershell* 那样的脚本时，我就会使用 Just。

比如说我想用 Pandoc + Typst 把 Markdown 转为 PDF，我希望可以只输文件的名字，而不用打很长的命令。

使用 Make 可以这样写，然后使用 `make example.pdf` 生成文件

```makefile
%.pdf: %.md
	pandoc -s $< -o $@ \
		--from markdown \
		--pdf-engine=typst
```

而 Just 只用这样写，然后使用 `just typst example` 生成文件

```justfile
typst name:
    pandoc -s {{name}}.md -o {{name}}.pdf \
        --from markdown \
        --pdf-engine=typst
```

可以看到，Just 明显可读性更好，而且不一定要使用 `tab` 键，比如前面的代码里就是用`空格`缩进的。

但上面的例子其实并没有体现出 Just 的优点。毕竟转换成 PDF 也算个构建任务，而 Make 是个构建系统，它可以自动比较 md 文件 和 pdf 文件的修改日期，判断要不要重新构建，而 Just 做不到这一点。

而下面这个例子才真正能够体现 Just 作为一个任务运行器的优势

Just 的版本，使用时只需 `just train coco8 yolo11n 50 8 0.01` 即可

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

而 Make 的版本如下，使用时需要 `make train DATA=coco MODEL=yolo11n EPOCHS=50 BATCH=8 LR=0.001`

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

可以看到，Just 显然更好写，不需要 `.PHONY` 了。Just 也更好读，第一个例子应该体现的更明显。

另外 Just 还有一个我很喜欢的功能。`just --list` 可以列出所有任务，并会显示参数以及任务描述。任务描述就是写在任务定义上一行的注释。这个功能可能并不是很实用，但真的非常 cool。
