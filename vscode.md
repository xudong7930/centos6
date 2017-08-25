vscode
======

# 加入命令行
command + shift + p -> 输入: shell Command: Install

从命令行启动: code .

## 快捷键

> ctrl + ` 隐藏和显示终端  
> ctrl + tab 切换tab  
> command + p 文件搜索  
> command + b 隐藏和显示侧边栏  
> command + shift + f 文件搜索  
> f1 设置  
> command + j 显示命令行  
> command + delete 删除文件
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


## 插件
1. vscode-icons
2. Project Manager
3. Path Intellisense
4. Debugger for Chrome
5. Bookmarks


## setting.json
```json
{
    "window.zoomLevel": -1,
    "window.openFilesInNewWindow": "off",
    "files.autoSave": "off",

    "editor.fontSize": 14,
    "editor.lineNumbers": "on",
    "editor.lineHeight": 28,
    "editor.rulers": [80, 120],
    "editor.mouseWheelZoom": true,
    
    // php
    "php.validate.enable": true,
    "php.validate.executablePath": "/usr/local/opt/php71/bin/php",
    "php.validate.run": "onType",
    "php.suggest.basic": true,

    // explorer
    "explorer.openEditors.visible": 0,

    // workbench
    "workbench.welcome.enabled": false,
    "workbench.activityBar.visible": false,
    "workbench.iconTheme": "vscode-icons",
    "workbench.statusBar.visible": false,
    "workbench.sideBar.location": "right",

    // terminal
    "terminal.integrated.shell.windows": "D:/Tools/git/bin/bash.exe",
    "terminal.integrated.fontFamily": "Consolas, 'Microsoft YaHei UI', 'Courier New'",
    "terminal.integrated.fontSize": 16,
    "terminal.integrated.lineHeight": 2.0,
    "terminal.integrated.cursorBlinking": true,
    "terminal.integrated.cursorStyle": "line"

    "files.exclude": {
        "**/.idea": true,
        "**/.vscode": true,
        "**/node_modules": true,
        "**/.git": true,
        "**/.svn": true,
        "**/.hg": true,
        "**/CVS": true,
        "**/.DS_Store": true
    }
}
```
