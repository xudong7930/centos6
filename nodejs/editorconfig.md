全局安装或局部安装editorconfig依赖包(npm install -g editorconfig | npm install -D editorconfig)
打开需要格式化的文件并手动格式化代码（shift+alt+f）

```js
# 表示是最顶层的配置文件，发现设为true时，才会停止查找.editorconfig文件
root = true

# 对于所有的文件  始终在文件末尾插入一个新行
[*]
end_of_line = crlf
insert_final_newline = true

# 对于所有的js文件，设置文件字符集为utf-8
[*.js]
charset = utf-8

# 设置所有JS,vue的缩进为
[*.{js,vue}]
indent_style = tab
indent_size = 4

```