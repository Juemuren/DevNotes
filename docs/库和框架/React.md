# React

## 简介

用于构建 Web 和原生交互界面的库，非常流行，不过有时也被批评为臃肿

## 安装

我比较习惯使用 `Vite` 来初始化 React 应用

```sh
npm create vite@latest my-react-app -- --template react
```

这会使用 `react` 模板新建一个名为 `my-react-app` 的项目，然后可以使用 `npm install` 一键安装所有的依赖。新版的 `Vite` 可以自动帮你安装依赖

另外 `create-react-app` 也是种选择，而且这似乎是官方的工具

```sh
npx create-react-app my-app
```

## 特点

React 开创了组件的概念，并拓展了 `js` 的语法。这个新的语法特性使得可以在代码中直接编写 HTML 代码

```jsx
const element = <h1>Hello, World!</h1>;

const App = () => {
  const name = "React";
  return (
    <div>
      <h1>Hello, {name}!</h1>
    </div>
  );
};
```

这种语法浏览器里的解释器是无法理解的。因此一般会把用到新特性的文件后缀改为 `jsx`，已表明该文件需要特殊处理。

`React` 的这种想法影响到了后来一些的框架，比如 `Vue`，后者也支持使用组件和 `jsx`

## 使用

React 本身发展很快，语法也一直在变。React 主要用于渲染界面，同时要提供了状态管理功能，以便辅助渲染

### hook

主要由 `useState` 和 `useEffect` 组成。

由钩子定义的状态在改变后组件就会自动重新渲染，我认为这也是 React 叫 React 的原因

### context

当某些状态需要在组件间层层传递时，可以使用上下文来简化代码

## 相关工具

React 本身是个框架，同时还衍生出了很多库和框架。这种强大的生态使得用 React 搭建应用很方便

- react-router 处理路由的库
- react-query 管理异步查询的前端状态的库
- react-redux 使用 redux 状态管理的工具
