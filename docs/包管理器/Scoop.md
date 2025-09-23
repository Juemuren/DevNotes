# Scoop

[官网](https://scoop.sh/)

## 简介

Scoop 是 Windows 平台的一个包管理器。虽然官方说自己不是 *包管理器*，而是 *安装器*，但在我看来 Scoop 确实做了包管理器该做的所有事情。然而这只是个非常细微的差别，不必纠结。

不过 Scoop 确实和常见的包管理器不同。Scoop 并不能打包程序，因为 Scoop 只是指定了软件如何安装；Scoop 也不处理复杂的依赖，因为 Scoop 的安装方式使得各软件相互独立，很难发生冲突。

Scoop 用一个 *JSON* 文件指定了软件从哪里下载、如何安装、如何检查是否有更新，并可能会修改一些环境变量或运行一些 PowerShell 命令。你可以运行 `scoop cat git` 来查看这个清单文件的具体内容。

## 对比

[和 Chocolatey、Winget 的对比](https://github.com/ScoopInstaller/Scoop/wiki/Chocolatey-and-Winget-Comparison)

Windows 系统软件依赖通常不会很复杂，因为软件通常都是单独在一个目录里安装，附带了所有的运行时。而 Linux 系统为了节省空间，程序都是动态链接的，不会单独在一个目录里安装，而是散布在系统的各个角落，并疯狂地复用系统的运行时。所以 Windows 系统是可以手动安装软件的，但 Linux 基本上不可能不使用包管理器。

虽然说 Windows 平台不是那么需要包管理器，但 Scoop 确实提供了一些好处，具体地说

- 让安装、卸载更方便了。不需要上官网下载文件，不需要和安装程序反复交互，使用 Scoop 只需运行一个命令就可以安装软件。同样的，卸载也不需要和卸载程序反复交互，只需要一行命令。
- 让软件更新变得自动化。Scoop 可以列出所有安装的软件，能够检查是否有软件可以更新，还可以一个命令更新所有可更新软件，不需要每个软件都手动去官网下载和更新。
- 缓解了 *PATH* 的膨胀。虽然 Windows 平台每个软件都安装在各自的目录里确实避免了依赖冲突，但这样也导致了一些问题：若每个软件都要添加一条 *PATH*，那么 *PATH* 就会变得很长。然而很多应用其实只需要用到少数几个可执行文件。Scoop 通过创建 *shim* 解决了这个问题。

> [!NOTE]- SHIM 和 PATH
> 所谓的 *shim*，其实就是为一个可执行文件的代理，这个代理放在能够被 shell 找到的位置。代理本身也可执行，执行时会调用实际的文件来处理命令。
>
> Scoop 使用 *shim* 替代 *PATH* 是有例外的。比如，若可执行文件过多，Scoop 还是会添加一条 *PATH*，毕竟在清单文件里给几百个可执行文件（比如 miktex）分别创建 *shim* 不太现实；另外，如果软件的后续版本会不断增加可执行文件，或者使用过程中会产生或下载一些可执行文件，Scoop 也只能添加 *PATH*。*PATH* 膨胀在 Windows 平台是个难以解决的问题，Scoop 只能缓解，也许 *环境管理器* 可以根治，但目前还没有这样的工具。好在 *PATH* 上限够大（据说 Windows 上是 **8192** 个字符），在触及上限之前，环境都是暂时安全的。

根据 Scoop 的原理，有一些软件很适合用 Scoop 安装

- 没办法自我更新的软件
- 可执行文件比较少的或完全静态链接的软件
- 可以便携安装，不会修改系统其余部分的软件

我个人只使用 Scoop 安装命令行工具和字体。常用的命令行工具一般都会在官方的 *main bucket* 里，而这个桶默认就已经添加了。而字体不在官方主桶里，需要先运行 `scoop bucket add nerd-fonts` 添加桶，再安装字体。

有图形界面的程序我还是更习惯手动安装。当然也可以添加 *extra bucket* 然后用 Scoop 来安装。

## 安装

[官方文档](https://github.com/ScoopInstaller/Install#readme)

```pwsh
# 获取安装脚本
irm get.scoop.sh -outfile 'install.ps1'
# 安装在指定的目录
.\install.ps1 -ScoopDir 'D:\Applications\Scoop'
```

## 初始化和设置

### 基本工具

Scoop 自身会使用一些工具，缺失它们会导致 Scoop 功能不全。你可以运行 `scoop checkup` 看看缺少什么

- `scoop install git` Scoop 中的桶使用 Git 进行管理, 如果要更新或添加其它桶则必须安装 Git。部分工具安装时也要使用 Git，比如 `vcpkg`
- `scoop install 7zip dark innounp` Scoop 安装一些软件时要用到这些工具
- `scoop install sudo` Scoop 添加服务等操作则需要管理员权限。不过新版的 Windows 已经在系统层面提供了 `sudo` 命令，可以在 `设置 -> 系统 ->  高级 -> 启用 sudo` 里开启，详见 [Windows 官方文档](https://learn.microsoft.com/zh-cn/windows/advanced-settings/sudo/)

### 增强工具

有一些工具安装后能够增强 Scoop，比如 `aria2`。这是一个命令行下载工具，运行 `scoop install aria2` 后 Scoop 就会自动使用它进行下载。Scoop 还有很多与此相关的设置，运行 `scoop config --help` 可以找到这些设置的相关信息

- `aria2-enabled` 是否启用，默认 **true**
- `aria2-warning-enabled` 是否显示警告，默认 **true**
- `aria2-retry-wait` 重试间隔秒数，默认 **2**
- `aria2-split` 下载的连接数，默认 **5**
- `aria2-max-connection-per-server` 对单个服务器的最大连接数，默认 **5**
- `aria2-min-split-size` 单个连接分到最小的下载量，默认为 **5M**
- `aria2-options` 更多的设置，默认值为空

### 修改设置

有一些设置修改后可以改善体验，比较建议开启

- `scoop config use_sqlite_cache true` 使用 **SQLite** 缓存，这会让 `scoop search` 和 `scoop shim` 命令变快
- `scoop config use_isolated_path true` 让 Scoop 添加的 *PATH* 与系统自带的 *PATH* 分离，前者将会保存在 *SCOOP_PATH* 里，Shell 启动时会自动把 *SCOOP_PATH* 里的路径加到 *PATH* 中

## 使用

### 常用命令

```sh
# 安装新应用
scoop install git
# 卸载应用
scoop uninstall git
# 更新 Scoop 自身
scoop update
# 更新应用
scoop update git
# 更新所有可更新应用
scoop update *
# 删除旧版本应用
scoop cleanup git
# 删除所有旧版本应用
scoop clean *
# 查看 Scoop 状态
scoop status
# 列出所有已安装应用
scoop list
```

Scoop 可以通过 `scoop search xxx` 来搜索应用，用 `scoop info git` 来查看应用的详细信息。不过我个人更喜欢在 [Scoop 官网](https://scoop.sh/#/apps)上搜索和查看这些东西

### 管理脚本

Scoop 的 *shim* 机制不仅是一种防止 *PATH* 膨胀的好东西，还能方便脚本的管理。

你可以通过以下命令在 Scoop 的 `shims` 目录下新建一个名为 `example` 的脚本，并填上一些默认的参数

```sh
scoop shim add example 'path\to\script' '--' -arg1 val1 -arg2 val2
```

你可以使用 `scoop shim list` 列出创建的所有 *shim*。不过很可惜，似乎只有 `exe` 后缀的 *shim* 才会被列出来。

### 创建自己的桶

有些时候你可能觉得官方桶里某些程序的安装方式不合心意。这时你要么去手动安装软件，但这样很不优雅；要么去提 *Issues* 或 *PR*，但官方对 PR 的要求很严格，而且审核非常慢。最好的方式就是创建一个自己的桶，用自己的满意的方式来安装。

你可以去看看官方的[桶模板](https://github.com/ScoopInstaller/BucketTemplate)来学习如何创建自己的桶。

我已经创建了一个自己的桶，你可以通过以下方式来使用

```pwsh
# 添加桶，可以随便取个名字
scoop bucket add <bucket-name> https://github.com/Juemuren/ScoopBucket
# 安装这个桶里的软件
scoop install <bucket-name>/<manifest-name>
```
