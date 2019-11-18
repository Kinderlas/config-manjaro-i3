set nocompatible
set nobackup

syntax enable
syntax on
set t_Co=256
set history=500
set nu
set mouse=a


if has("win32") || has("win64")
   "set guifont=DejaVu_Sans_Mono:h10:cDEFAULT
   set guifont=consolas:h15:cDEFAULT
else
   set guifont=consolas\ 16
endif

set wildmenu
set completeopt=longest,menu
set clipboard+=unnamed 
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}et autoread
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏工具栏
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
"set completeopt=preview,menu 
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
"set laststatus=1    " 启动显示状态行(1),总是显示状态行(2)  

set fileencodings=utf-8,sjis,gb2312,gb18030,gbk,ucs-bom,cp936,latin1,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,cp932
" 如果你要打开的文件编码不在此列，那就添加进去
set termencoding=utf-8

set backupdir=~/.vim/backup

" TAB距离 (vim配置; vim技巧)
set ts=2          " 保存一个tab是4个字符
set expandtab                 " 将tab键转换为空格
set tabstop=2
set softtabstop=2      " 回退4格
set shiftwidth=2       " shiftwidth写代码时用到,缩进为4字符
set autoindent
set smartindent
set smarttab

set smartcase

set ruler
set showcmd 

"show tab
"set list
"set listchars=tab:>- 

if has("autocmd")
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 expandtab
  autocmd FileType python setlocal ts=2 sts=2 sw=2 expandtab
endif

"inoremap ( ( )<LEFT><LEFT>
"inoremap { { }<LEFT><LEFT>
"inoremap [ [ ]<LEFT><LEFT>
"inoremap < <= =><LEFT><LEFT><LEFT> " for ROR

set langmenu=zh_CN.UTF-8
" 设置当文件被改动时自动载入
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
"if version >= 603
"set helplang=cn
"set encoding=gbk
"endif
colorscheme desert
source $VIMRUNTIME/mswin.vim
behave mswin

nmap <leader>f :find<cr>



" 映射全选+复制 ctrl+a
"map <C-A> ggVGY
"map! <C-A> <Esc>ggVGY
"map <F12> gg=G
" 选中状态下 Ctrl+c 复制

vmap <C-c> "+y

"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 

map <F12> <ESC>:w<CR> <ESC>:!python % <CR>

nnoremap j jzz
nnoremap k kzz
nnoremap H gT
nnoremap L gt
map <M-i> caw
map <esc>i caw
map <M-d> daw
map <esc>d daw
set pastetoggle=<F9>
map q zz

"nnoremap <C-i> ofreopen("in.txt", "r", stdin);<esc>
"nnoremap <C-o> ofreopen("out.txt", "w", stdout);<esc>


"map <M-j> <C-d>zz
map <esc>j <C-d>zz
map <A-j> <C-d>zz

"map <M-k> <C-u>zz
map <esc>k <C-u>zz
map <A-k> <C-u>zz


"set nocp
filetype plugin indent on 

"打开文件类型检测, 加了这句才可以用智能补全

"set tags=C:\"Program Files (x86)"\Vim\vim73\tags
set autochdir

" 打开文件时光标自动到上次退出该文件时的光标所在位置
autocmd BufReadPost * if line("'\"") && line("'\"") <= line("$") | exe "normal`\"" | endif


"call plug#begin('~/.vim/plugged')
"Plug 'lervag/vimtex'
"call plug#end()
"execute pathogen#infect() 
"

" Pathogen
" execute pathogen#infect()
" call pathogen#helptags() 

vnoremap <C-c> "*y
