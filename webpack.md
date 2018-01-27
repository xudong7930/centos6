webpack
=======

## 安装webpack
> npm view webpack versions --json  
> npm i webpack@2.6.1 -g  
> npm i lodash --save

## 常用开发包
* npm i -D style-loader css-loader "css文件处理"
* npm i -D sass-loader node-sass "SASS文件处理"
* npm i -D file-loader url-loader "图片,字体,文件加载"
* npm i -D csv-loader xml-loader json-loader "CSV,XML,JSON文件处理"
* npm i -D webpack-dev-server "开发服务器"
* npm i -D rimraf "删除文件"  
* npm i -D babel-loader babel-core "babeljs" 
* npm i -D cross-env "跨平台环境设置"

## webpack cli





webpack
=======

## 安装webpack
> npm view webpack versions --json  
> npm i webpack@2.6.1 -g  
> npm i lodash --save

## 常用开发包
* npm i -D html-loader "html文件处理"
* npm i -D style-loader css-loader "css文件处理"
* npm i -D sass-loader "SASS文件处理"
* npm i -D file-loader url-loader "图片,字体,文件加载"
* npm i -D csv-loader xml-loader json-loader "CSV,XML,JSON文件处理"
* npm i -D webpack-dev-server "开发服务器"
* npm i -D rimraf "删除文件"  
* npm i -D babel-loader babel-core "babeljs" 
* npm i -D cross-env "跨平台环境设置"

* npm i -D babel-loader babel-core babel-preset-es2015 babel-preset-stage-0 babel-preset-react "React和ES6支持"
* npm i -D extract-text-webpack-plugin "抽取CSS为单独的文件"
* npm i -D html-webpack-plugin "新建index.html页面"
* npm i -D open-browser-webpack-plugin "自动打开浏览器的插件"

* npm i -D eslint eslint-config-enough eslint-loader "js语法检查"

eslint的package.json配置:
```json
{
    'eslintConfig': {
        'env': {
            'browser': true,
            'node': true
        }
    }
}
```



npm view webpack versions --json
npm i -D webpack@3.0.0-rc.2

# 打包
webpack ./src/app.js ./dist/app.bundle.js 

# -p 打包压缩
webpack -p ./src/app.js ./dist/app.bundle.js

# watch代码
webpack ./src/app.js ./dist/app.bundle.js --watch

# html模板
> npm i html-webpack-plugin -D

# 样式加载
> npm i css-loader -D
> npm i style-loader -D
> npm i node-sass sass-loader -D
> npm i extract-text-webpack-plugin -D

# 构建webpack server环境
> npm i webpack-dev-server -D
> npm i rimraf -D

# 构建react环境
> npm i react react-dom --save
> npm i babel-preset-react babel-preset-es2015 -D
> npm i babel-core babel-loader -D

# pug
> npm i pug pug-html-loader -D


