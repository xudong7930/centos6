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
    <!-- Optional: Set a tabTrigger to define how to trigger the snippet -->
     <tabTrigger>met</tabTrigger>
    <!-- Optional: Set a scope to limit where the snippet will trigger -->
     <scope>source.php</scope>
</snippet>
```


## 7. Package Console
```python
import urllib.request,os,hashlib; h = 'df21e130d211cfc94d9b0905775a7c0f' + '1e3d39e33b79698005270310898eea76'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); urllib.request.install_opener( urllib.request.build_opener( urllib.request.ProxyHandler()) ); by = urllib.request.urlopen( 'http://packagecontrol.io/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); print('Error validating download (got %s instead of %s), please try manual install' % (dh, h)) if dh != h else open(os.path.join( ipp, pf), 'wb' ).write(by)
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


插件配置
```json
{
    "default": {
        "debug": false,
        "delay": 0.25,
        "error_color": "D02000",
        "gutter_theme": "Packages/SublimeLinter/gutter-themes/Default/Default.gutter-th,eme",
        "gutter_theme_excludes": [],
        "lint_mode": "background",
        "mark_style": "outline",
        "no_column_highlights_line": false,
        "passive_warnings": false,
        "paths": {
            "linux": [],
            "osx": [],
            "windows": []
        },
        "python_paths": {
            "linux": [],
            "osx": [],
            "windows": []
        },
        "rc_search_limit": 3,
        "shell_timeout": 10,
        "show_errors_on_save": false,
        "show_marks_in_minimap": true,
        "syntax_map": {
            "python django": "python",
            "pythonimproved": "python",
            "magicpython": "python",
            "html 5": "html",
            "html (django)": "html",
            "html (rails)": "html",
            "javascript (babel)": "javascript",
            "php": "html"
        },
        "tooltip_fontsize": "1rem",
        "tooltip_theme": "Packages/SublimeLinter/tooltip-themes/Default/Default.tooltip-theme",
        "tooltip_theme_excludes": [],
        "tooltips": false,
        "warning_color": "DDB700",
        "wrap_find": true
    }
}
```

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
	"added_words": {
		"author": "xuergou",
		"color_scheme": "Packages/Theme - One Dark/One Dark.tmTheme",
		"theme": "One Dark.sublime-theme",
	},
	"always_show_minimap_viewport": false,
	"bold_folder_labels": true,
	"caret_style": "phase",
	"close_windows_when_empty": false,
	"color_scheme": "Packages/User/Kuroir Theme.tmTheme",
	"default_line_ending": "unix",
	"detect_intentation": false,
	"draw_minimap_border": true,
	"draw_white_space": "all",
	"ensure_newline_at_eof_on_save": true,
	"fade_fold_buttons": false,
	"findreplace_small": true,
	
	"font_options":
	[
		"subpixel_antialias"
	],
	"font_size": 15,
	"font_face": "Fira Code",

	"highlight_line": true,
	"highlight_modified_tabs": true,
	"hot_exit": false,
	"ignored_packages":
	[
		"Vintage"
	],
	"indent_guide_options":
	[
		"draw_normal",
		"draw_active"
	],
	"line_numbers": false,
	"line_padding_bottom": 9,
	"line_padding_top": 9,
	"margin": 0,
	"overlay_scroll_bars": "enabled",
	"preview_on_click": false,
	"remember_open_files": false,
	"rulers":
	[
		100
	],
	"scroll_past_end": true,
	"show_definitions": false,
	"show_encoding": true,
	"show_full_path": true,
	"show_line_endings": true,
	"show_panel_on_build": true,
	"soda_rect_scrollbars": true,
	"soda_tabs_autowidth": true,
	"tab_size": 4,
	"tabs_small": false,
	"theme": "SoDaReloaded Light.sublime-theme",
	"translate_tabs_to_spaces": true,
	"trim_trailing_white_space_on_save": false,
	"update_check": false,
	"word_wrap": true,
	"use_simple_full_screen": true,
	"folder_exclude_patterns": [".svn", ".git", ".hg", "CVS", "node_module", ".idea", ".vscode"],
	"file_exclude_patterns": ["*.pyc", "*.pyo", "*.exe", "*.dll", "*.obj","*.o", "*.a", "*.lib", "*.so", "*.dylib", "*.ncb", "*.sdf", "*.suo", "*.pdb", "*.idb", ".DS_Store", "*.class", "*.psd", "*.db", "*.sublime-workspace"],
	"auto_indent": true,
	"auto_complete_commit_on_tab": false
}
```

## 2. V3126注册码
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
