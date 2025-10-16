# Expo

<!-- TODO 模拟器 -->

## 模拟器

### 安卓模拟器

官方文档里只有两种方法

- 真实设备。下载 Expo Go。扫码。最方便，体验也比模拟设备好。不过缺点就是必须得有一台安卓设备。
- 使用 Android Studio。我不是很喜欢。因为得安装一个完整的 IDE 并配置 Java 环境。而且模拟器体验还不太好。最大优点就是与 Expo 集成很好。

另外还有别的方法，但略微有点限制

- 玩游戏用的模拟器。性能比 Android Studio 的更好，还有键位映射（毕竟是玩用来游戏的）。不过需要侧载 Expo Go 应用。复制 URL 连接到应用，但无法 *摇一摇* 在手机里启动开发者面版。
- WSA。与 Windows 集成最好，微软已经停止支持，但社区仍然在维护。可以参照指南[安装 WSA](https://github.com/MustardChef/WSABuilds) 并[侧载应用](https://github.com/MustardChef/WSABuilds/blob/master/Documentation/Usage%20Guides/Sideloading%20Guides/WSAFiles.md)应用。缺点同上。

### 苹果模拟器

苹果是高贵的系统，只要 MacOS 才可以运行 iOS 模拟器，其它平台都不行。

如果手里没有苹果公司的机器，建议放弃调试苹果应用。
