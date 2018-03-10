set nocompatible "不兼容vi一致性模式"
colorscheme desert "编辑器颜色主题"
syntax on "代码语法高亮"
filetype on "检查文件类型"

set number "不显示行号"
set autoindent "自动缩进"
set guifont=Fira_Code:h14 "字体,字体行高"
set backspace=indent,eol,start "退格键有效"
set encoding=utf-8 "vim内部编码"
set fileencoding=utf-8 "当前编辑的文件编码"
set fileencodings=utf-8 "vim启动时按照列出的编码逐一打开文件"
set termencoding=utf-8 "输出到客户端的编码"
set showmode "显示当前操作模式"
set showcmd "输入的命令显示出来"
set ignorecase smartcase "搜索时忽略大小写"
set hlsearch "搜索时高亮显示被找到的文本"
set incsearch "输入搜索内容就高亮显示搜索结果"
set nowrap "不自动换行"
set ruler "状态栏标尺"
set nobackup "覆盖文件时不备份"
set noswapfile "不需要交换文件"
set nowritebackup "保存时不写入备份文件"
set autoread "自动检测文件更改"
set autowrite "自动写入"
set foldenable "允许折叠"
set laststatus=2 "启动状态栏显示"
set linespace=16 "设置行高"
set nocp "使用vim而非vi"
set noeb vb t_vb= "关闭响铃"


"set paste 粘贴模式"
"set showmatch 括号自动补齐"


"======设置tab======="
set tabstop=4
set smarttab
set expandtab
set softtabstop=4
set shiftwidth=4
set shiftround

let mapleader="\<Space>" "设置使用空格键作为热键"
nnoremap <Leader>w :w<cr> "保存文件快捷键"
nnoremap <Leader>q :q!<cr> "退出文件"
