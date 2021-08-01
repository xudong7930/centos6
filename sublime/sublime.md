sublime的日常使用
================


## 9. 默认快捷键
* option+shift+↑|↓  "向上向下选中行"
* "put cursor on word" -> ctrl+super+g "all word select"
* "put cursor on word" -> super+d  "multiper word select"
* alt+super+2 "two colums"
* super+w  "close file"
* super+p  "search file"
* super+r  "view symbol"
* super+p+filename@method  "view file method"

AdvancedNewFile Plugin
New File

* super+alt+n -> "Path/To/File" "new file, use tab to autocomplete."
* super+alt+n -> ":NewController.php" "create file in current directory."

Drop File
* choose current file -> super + shift + p -> anf: delete current file

Rename file


## 8. 新建code snnipes
新建SublimeText3/Packages/User/Snippets/PHP Method.sublime-snippet
```xml
<snippet>
    <content><![CDATA[
public function ${1}()
{
    ${2}
}
]]></content>
     <tabTrigger>met</tabTrigger>
     <scope>source.php</scope>
     <description></description>
</snippet>
```


## 7. Package Console
```python
import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'https://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
```

## 6. sublime字体
> "font_face": "Consolas Bold"  
> "font_face": "Comic Sans MS"  

## 5. PHP开发配置
安装如下插件:
1. SublimeLinter
2. SublimeLinter-php
4. PHP Companion
5. PHP Setter And Getter
6. Docblr
7. AdvancedNewFile
8. ConvertToUtf8
9. Emmet
10. Terminal
11. Theme - SoDaReloaded
12. Theme - One Dark
13. SimplePHPUnit
14. Laravel 5 Artisan
15. [sublime-phpunit](https://github.com/adamwathan/sublime-phpunit)
16. A File Icon
17. INI
18. Laravel Blade Hightlighter
19. nginx
20. PackageResourceViewer
21. Vue Syntax Highlight

快捷键配置:
```json
[
    // toggle side bar
    { "keys": ["ctrl+1"], "command": "toggle_side_bar" },


    // expand class: use Request->ctrl+2
    { "keys": ["ctrl+2"], "command": "expand_fqcn" },
    { "keys": ["ctrl+3"], "command": "expand_fqcn", "args": {"leading_separator": true} },

    // import for use /path/to/class
    { "keys": ["ctrl+4"], "command": "find_use" },

    // import namespace
    { "keys": ["ctrl+5"], "command": "import_namespace" },

    { "keys": ["ctrl+6"], "command": "implement" },
    { "keys": ["ctrl+7"], "command": "goto_definition_scope" },
    
    // generate attr and constructor
    { "keys": ["ctrl+8"], "command": "insert_php_constructor_property" },
]
```


## 4. 编译PHP代码
新建**C:\Users\xd\AppData\Roaming\Sublime Text 3\Packages\User\PHP.sublime-build**文件
```json
{
    "cmd": ["D:\\Tools\\php\\php.exe", "$file"],
    "file_regex": "php$",
    "selector": "source.php"
}
```

## 3. 设置
```json
{
    "animation_enabled": true,
    "auto_complete_selector": "source, text, meta.tag - punctuation.definition.tag.begin, source - comment - string.quoted.double.block - string.quoted.single.block - string.unquoted.heredoc",
    "auto_indent": true,
    "bold_folder_labels": false,
    "close_windows_when_empty": false,
    "color_scheme": "Packages/User/Color Schem/One Dark (XUDONG).tmTheme",
    "create_window_at_startup": true,
    "draw_white_space": "none",
    "folder_exclude_patterns":
    [
        ".svn",
        ".git",
        ".DB_Store",
        ".vscode",
        ".vagrant"
    ],
    "font_face": "Fira Code",
    "font_size": 15,
    "highlight_line": true,
    "ignored_packages":
    [
        "Vintage"
    ],
    "line_numbers": true,
    "line_padding_bottom": 9,
    "line_padding_top": 9,
    "margin": 0,
    "one_dark_native_title_bar": true,
    "one_dark_show_scroll_tabs": false,
    "one_dark_show_tabs_dropdown": false,
    "preview_on_click": false,
    "show_encoding": true,
    "show_full_path": false,
    "show_panel_on_build": true,
    "theme": "One Dark.sublime-theme",
    "tree_animation_enabled": true,
    "update_check": false,
    "word_wrap": "auto"
}
```

## 2. Enter License
V3143注册码:
```
—– BEGIN LICENSE —–
TwitterInc
200 User License
EA7E-890007
1D77F72E 390CDD93 4DCBA022 FAF60790
61AA12C0 A37081C5 D0316412 4584D136
94D7F7D4 95BC8C1C 527DA828 560BB037
D1EDDD8C AE7B379F 50C9D69D B35179EF
2FE898C4 8E4277A8 555CE714 E1FB0E43
D5D52613 C3D12E98 BC49967F 7652EED2
9D2D2E61 67610860 6D338B72 5CF95C69
E36B85CC 84991F19 7575D828 470A92AB
—— END LICENSE ——
```


V3126注册码
```
– BEGIN LICENSE —–
Michael Barnes
Single User License
EA7E-821385
8A353C41 872A0D5C DF9B2950 AFF6F667
C458EA6D 8EA3C286 98D1D650 131A97AB
AA919AEC EF20E143 B361B1E7 4C8B7F04
B085E65E 2F5F5360 8489D422 FB8FC1AA
93F6323C FD7F7544 3F39C318 D95E6480
FCCC7561 8A4A1741 68FA4223 ADCEDE07
200C25BE DBBC4855 C4CFB774 C5EC138C
0FEC1CEF D9DCECEC D3A5DAD1 01316C36
—— END LICENSE
```

## 1.隐藏侧边栏快捷键
> {"keys": ["f1"],"command": "toggle_side_bar"}

