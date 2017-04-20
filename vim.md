vim
===



## ~/.vimrc
```
"6.其它设置"
syntax on "语法高亮"
set wildmenu "按TAB键时命令行自动补齐"
set nonumber "显示行号"
set ignorecase "忽略大小写"
set ruler "显示当前光标位置"
set autoread "文件在Vim之外修改过，自动重新读入"
set autowrite "设置自动保存内容"
set nocp "使用vim而非vi"
set cursorline "高亮当前行"
filetype on "启动文件类型检查"
filetype plugin on "运行vim加载文件类型插件"
set helplang=cn "显示中文帮助语言"
set showcmd "显示命令"
set paste "粘贴模式"

"5.设置缩进"
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set smarttab
set cindent "c/c++自动缩进"
set autoindent "参考上一行的缩进方式进行自动缩进"
filetype indent on "根据文件类型进行缩进"


"4.搜索设置"
set hlsearch "开启搜索结果的高亮显示"
set incsearch "边输入边搜索"

"3. 查找和替换文本"
nmap ;s :%s/\<<C-R>=expand("<cword>")<CR>\>/
nmap ;g :vimgrep <C-R>=expand("<cword>")<CR>


"2.不要交换文件和备份文件,减少冲突"
set nobackup
set noswapfile
set nowritebackup

"1.设置文件编码，解决中文乱码问题"
set encoding=utf-8
set termencoding=utf-8
if has("multi_byte")
	set fileencodings=utf-8,ucs-bom,cp936,cp1250,big5,euc-jp,euc-kr,latin1
else
	echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif
```
