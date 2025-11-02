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

### 组件和 JSX

React 开创了组件的概念，并拓展了 `js` 的语法。这个新的语法特性使得可以在代码中直接编写 HTML 代码

```jsx
// JSX 拓展语法
const element = <div>JSX Example</div>;

// 组件
const App = () => {
  const name = "React";
  return (
    <div>
      <h1>Hello, {name}!</h1>
      {element}
    </div>
  );
};
```

这种语法浏览器是无法理解的。因此一般会把用到新特性的文件后缀改为 `jsx`，已表明该文件需要特殊处理。

`React` 的这种想法影响到了后来一些的框架，比如 `Vue`，后者也支持使用组件和 `jsx`

### 虚拟 DOM

React 还有一个重要概念，就是**虚拟 DOM**。这个概念似乎并非起源于 React，但现在提起这个首先想到的就是 React

真实 DOM 可能很庞大，React 使用更轻量的虚拟 DOM 去模拟，这使得在 React 中操作 DOM 更加快速。当然了，虚拟 DOM 最终还是要映射回真实 DOM 的，因此其实很难比纯 JavaScript 更快。

不过也正是因为虚拟 DOM，后来才又有了 **React Native** 这种开发 Android/iOS 原生应用的框架。原理就是把虚拟 DOM 映射到原生的 Android/iOS UI，如同映射到 HTML DOM。

## 使用

React 本身发展很快，接口也一直在变，最佳实践也一直在变。早些时候 React 使用类组件，现在最佳实践已经变成函数组件了

React 主要用于渲染界面，同时也提供了状态管理功能，以便辅助渲染。这些状态管理主要是通过 *hook* 和 *context* 实现的。

- hook 主要由 `useState` 和 `useEffect` 组成。由钩子定义的状态如果发生改变，组件就会自动重新渲染
- context 当某些状态需要在组件间层层传递时，可以使用上下文来简化代码

## 相关工具

有很多基于 React 的库，通常都会以 *react-xxx* 开头，比如

- react-router 处理路由
- react-query 管理异步查询的前端状态
- react-redux 使用 redux 进行状态管理

React 本身算是个框架，但同时还衍生出了一些框架，比如 Next.js
