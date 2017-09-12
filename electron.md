electron.js
===========

##打包成mac|windows installer
下载builder
> npm i electron-builder --save-dev  

修改package.json
```json
"build": {
    "appId": "com.zqdl.xudong7930.tutorial",
    "productName": "tutorial"
},
"scripts": {
    "pack": "build --dir"
    "builder": "build"
}
```

生成包
> npm run builder -m|w|l 


