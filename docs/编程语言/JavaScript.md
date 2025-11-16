# JavaScript

## 环境搭建

### 获取工具链

JavaScript 的运行时一般选择 *nodejs*，不过 *deno*、*bun* 也是不错的。浏览器的控制台里也可以运行 JavaScript 代码，如果只是想写点浏览器脚本发到 GreasyFork，甚至都没必要本地搭建环境

如果不需要管理运行时版本，那么通过 scoop 直接安装即可，这默认会下载最新版

```sh
scoop install nodejs
# deno 和 bun 安装方式是一样的
scoop install deno
scoop install bun
```

如果有管理运行时版本的需要，则可以安装专门的工具，比如 `nvm` 可以用来管理不同版本的 `nodejs`。不过我个人更喜欢 [mise](../环境管理器/Mise.md)，这是一个可以管理多种语言运行时版本的工具。对于 **JavaScript**，它支持管理 `nodejs`、`deno`、`bun` 的运行时版本

如果选择 mise，则可以如下安装并使用不同版本的运行时

```sh
# 使用 node latest
mise use -g node
# 使用 node lts
mise use -g node@lts
# 使用 node 20
mise use -g node@20
# 使用 deno latest
mise use -g deno
# 使用 bun latest
mise use -g bun
```

### 编辑器集成

我使用 VSCode 来编写代码。对于 JavaScript，VSCode 几乎是开箱即用的，不需要安装任何额外插件

## 命令行工具

### 包管理器

- npm `nodejs` 的官方包管理器
- pnpm 改进的 `npm`，优点是更快和更节省硬盘空间
- ncu 增加了 `npm` 没有的功能。它会检查 `package.json` 文件，然后列出所有可以更新的依赖，也可以加个 `-u` 参数一键更新。不过这个工具只更新 `package.json` 文件，还要重新运行 `npm install` 来安装新版本的依赖

### 静态检查和格式化

- eslint 代码静态检查
- prettier 格式化

### 编译器

- typescript 其实叫转译器更合适。它可以对 TS 代码进行类型擦除，从而得到干净的 JS 代码，并且会在编译期进行类型等相关的检查。这事实上就是 typescript 的实现。

### 调试

- nodemon 监视文件，并在更改后重新运行，让开发更方便
- json-server 快速启动一个简易的本地 json 服务器，可以处理 RESTful 请求，一般都是本地调试用的

### 构建系统

- Vite 前端构建工具，有两个主要功能，即前端开发服务器和打包代码。前端开发服务器会自动监视文件，发现修改后会热重载，显著提高开发体验；而打包代码则是把网页相关代码打包到实际生产环境中，以便进一步部署
- Webpack 老牌打包工具

## 库和框架

### 前端框架

- React 库和框架的灰色地带，官方说法是 `用于构建 Web 和原生交互界面的库`，但社区又习惯称其为框架，毕竟它确实控制了部分渲染的流程。
- Apollo-Client 用来调用 graphql 接口的库，同时还有状态管理的功能

### 样式

- MUI 一个挺好看的 UI 库。不过用法和传统的 css 不一样，这个库提供的是组件
- Tailwind CSS 最近非常流行的 CSS 库，使用时只需在 class 中指定名字即可，不会破坏原有代码

### 网络请求

- Axios 一个语法简单的网络请求库

### 后端框架

- Express 用来实现 RESTful 接口
- Apollo-Server 用来实现 graphql 接口的框架

### 加密和验证

- bcrypt 加密库
- jsonwebtoken 处理 token 的，一般用于令牌的验证

### 轻型实用库

- dotenv 加载 .env 文件的
- morgan 打印请求日志用的，配置起来很简单
- cors 处理 CORS 错误的。浏览器有一些保护机制，可能会限制本地后端服务器的调试，这时可以用这个库

### 数据库映射

- mongoose 方便与 MongoDB 数据库交互。正式的说法是 ODM（对象文档映射），因为 MongoDB 是一个文档数据库，不是关系数据库

### 测试框架

- vitest 测试框架
- playwright 端到端的测试框架
