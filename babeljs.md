Babel
=====

[Babel](https://babeljs.io) 是一个广泛使用的 ES6 转码器，可以将 ES6 代码转为 ES5 代码，从而在现有环境执行


## 配置文件.babelrc
```json
{
    "presets": ["latest", "react", "stage-2"], // presets字段设定转码规则
    "plugins": []
}
```


Babel规则集合
```bash
# 最新转码规则
$ npm install --save-dev babel-preset-latest

# react 转码规则
$ npm install --save-dev babel-preset-react

# 不同阶段语法提案的转码规则（共有4个阶段），选装一个
$ npm install --save-dev babel-preset-stage-0
$ npm install --save-dev babel-preset-stage-1
$ npm install --save-dev babel-preset-stage-2
$ npm install --save-dev babel-preset-stage-3
```

## 命令行转码工具babel-cli
安装
> npm i babel-cli --save-dev  

转换 -s生成source map文件
* babel app.js -o app-new.js -s
* babel ./src -d ./dest

执行es6脚本
* babel-node app-es6.js
