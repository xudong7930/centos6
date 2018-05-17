vscode editor
================

## 基本信息
* 下载: https://code.visualstudio.com/download
* 文档: https://code.visualstudio.com/docs


## 文件编辑

> command + → 跳到行尾  
> command + ← 跳到行首  
> command + shift + → 选中当前位置到行尾  
> command + shift + ← 选中当前位置到行首  
> command + ctrl + shift + → 依次选中文本  
> alt + ↓  将选中行上下移动  
> alt + shift + ↓ 复制当前行并在下行插入  
> command + d 多行编辑  
> alt + command + [ 折叠代码  
> alt + command + ] 展开代码  
> command + [ 左边移动代码  
> command + ] 右边移动代码 

## 快捷键

* ctrl + ` 隐藏和显示终端  
* ctrl + tab 切换tab  
* command + p 文件搜索  
* command + b 隐藏和显示侧边栏  
* command + shift + f 文件搜索  
* f1 设置  
* command + j 显示命令行  
* command + delete 删除文件

## 加入命令行
command + shift + p -> 输入: shell Command: Install
从命令行启动: code .

## 推荐的扩展
* Path Intelisense
* PHP DocBlocker
* composer
* advanced-new-file
* Better PHPUnit
* Babel ES6/ES7
* ESLint
* File Utils
* Htmltagwrap
* Laravel Artisan
* php cs fixer
* PHP Debug
* PHP Intelehense
* Vetur
* Slime Theme
* One Dark Pro

## setting.json配置文件
```json
{
    "window.zoomLevel": -0.5,
    "window.openFilesInNewWindow": "off",
    "editor.fontFamily": "Fira Code",
    "editor.fontSize": 16,
    "editor.lineNumbers": "on",
    "editor.lineHeight": 30,
    "editor.renderWhitespace": "none",
    "editor.mouseWheelZoom": false,
    "editor.minimap.enabled": false,
    "editor.autoIndent": true,
    "editor.wordWrap": "on",
    "editor.fontLigatures": true,
    "editor.tabCompletion": true,
    "editor.renderIntentGuides": false,
    
    // php
    "php.validate.enable": true,
    "php.validate.executablePath": "/usr/local/opt/php71/bin/php",
    "php.validate.run": "onSave",
    "php.suggest.basic": false,

    // emmet
    "emmet.triggerExpansionOnTab": true,
    "emmet.includeLanguages": {
        "vue-html": "html",
        "vue": "html"
    },

    // explorer
    "explorer.openEditors.visible": 0,
    "explorer.confirmDelete": false,

    // workbench
    "workbench.activityBar.visible": false,
    "workbench.statusBar.visible": true,
    "workbench.startupEditor": "newUntitledFile",
    "workbench.colorTheme": "Slime",

    // terminal
    "terminal.integrated.fontFamily": "'Fira Code', Menlo, Monaco, 'Courier New', monospace",
    "terminal.integrated.fontSize": 12,
    "terminal.integrated.lineHeight": 1.2,
    "terminal.integrated.cursorBlinking": true,
    "terminal.integrated.cursorStyle": "block",

    // files
    "files.autoSave": "off",
    "files.associations": {
        "*.blade.php": "html"
    },
    "files.exclude": {
        "**/.vscode": false,
        "**/node_modules": true,
        "**/.git": true,
        "**/.svn": true,
        "**/.hg": true,
        "**/CVS": true,
        "**/.DS_Store": true,
        "**/.styleci.yml": true,
        "**/.editorconfig": true
    },
    "git.enableSmartCommit": true,
    "php-cs-fixer.config": "/Users/xudong7930/.vscode/.php_cs",
    "php-cs-fixer.onsave": true,
    "eslint.validate": [
        "javascript",
        "javascriptreact",
        "vue",
        "vue-html"
    ],
    "composer.executablePath": "/usr/local/bin/composer",
    "workbench.iconTheme": "vs-minimal"
}
```


## 键盘快捷键keybinding.json
```json
[
    {
        "key": "cmd+r",
        "command": "workbench.action.gotoSymbol"
    },
    {
        "key": "shift+cmd+r",
        "command": "workbench.action.showAllSymbols"
    },
    {
        "key": "cmd+t",
        "command": "better-phpunit.run"
    },
    {
        "key": "shift+cmd+t",
        "command": "better-phpunit.run-previous"
    }
]
```
