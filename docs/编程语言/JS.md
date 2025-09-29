# JS

## 环境搭建

JS 环境搭建应该是最简单的了。只需下载 `nodejs` 就行

我是使用 scoop 安装的

```sh
scoop install nodejs
```

另外还有一个叫 `nvm` 的工具可以用来管理不同版本的 `nodejs`。不过我因为没有需求，从未用过

## 命令行工具

### 包管理器

- npm 官方标准
- pnpm 改进的官方包管理器，主要优化是节省硬盘空间
- ncu 严格地说这玩意不是包管理器。它可以检查 `package.json` 文件，并列出所有可以更新的库，也可以加个参数一键更新。按理说这是包管理器的职责，但不知道为什么 npm 没有这个功能，因此需要依靠别的工具来实现

### 静态检查和格式化

- eslint 代码静态检查
- prettier 格式化

### 调试

- nodemon 监视文件
- json-server 快速启动一个简易的本地 json 服务器，可以处理 RESTful 请求，一般都是本地调试用的

### 构建系统

- Vite 前端构建工具，有两个主要功能，即前端开发服务器和打包代码。前端开发服务器会自动监视文件，发现修改后会热重载，显著提高开发体验；而打包代码则是把网页相关代码打包到实际生产环境中，以便进一步部署
- Webpack 老牌打包工具

## 库和框架

### React 工具链

- React 库和框架的灰色地带，官方说法是 `用于构建 Web 和原生交互界面的库`，但社区又习惯称其为框架，毕竟它确实控制了部分渲染的流程。不过如果把 React 相关的工具链都算上，那我觉得勉强可以算是框架
- react-hook 这个是 React 自带的功能，hook 定义的状态改变后组件就会自动重新渲染，我认为这也是 React 叫 React 的原因
- react-context 这个也是 React 自带的，当某些状态需要在组件间层层传递时，可以用这个简化代码
- react-router 处理路由的库
- react-query 管理异步查询的前端状态的库
- react-redux React 应用使用 redux 状态管理的方法

### 接口设计

- Apollo 目前最先进的、用来设计 graphql 接口（一种旨在取代 RESTful 的新的接口设计方法）的框架，有服务端 `@apollo/server` 和客户端 `@apollo/client`
- Express 后端框架

### 网络请求

- Axios 一个语法简单的网络请求库

### 测试框架

- vitest 测试框架
- playwright 端到端的测试框架

### 后端的常用库

- dotenv 加载 .env 文件的
- bcrypt 加密库
- cors 处理 CORS 错误的。CORS 是一种浏览器保护机制，不过开发的时候我们通常希望给自己的开发服务器端口放权，可以用这个库
- jsonwebtoken 处理 token 的
- morgan 打印请求日志用的，配置起来很简单

### 数据库映射

- mongoose 方便与 MongoDB 数据库交互。正式的说法是 ODM（对象文档映射），因为 MongoDB 是一个文档数据库，不是关系数据库
