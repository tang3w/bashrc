" Author by Tang Tianyong
" Email to tang3w@gmail.com
" You are free to use this file

" No compatible
set nocompatible

" ((( Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,cp936 " ucs-bom means utf-8 without bom
set langmenu=zh_CN.UTF-8
" )))

" ((( Tab and space
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set ambiwidth=double " Display the 2-bytes character
" )))

" ((( Indent
set cindent
set autoindent
set cinoptions=(sus " Options of c/c++ indent style
" )))

" ((( Highlight
syntax on
colorscheme jellybeans
set guifont=Menlo\ Regular:h16
" )))

" Backspace
set backspace=indent,eol,start

" Ruler rules
set ruler

" ((( Search rules
set is
set nohls
" )))

" ((( Wrap and break
set nowrap
set linebreak
set whichwrap=b,s,<,>,[,]
" )))

" File type
filetype plugin indent on

" ((( Line number and background
set number
hi lineNr ctermfg=7 ctermbg=8
" )))

" Set the directory
set autochdir

" ((( Auto comment at next line
autocmd Filetype vim setlocal comments-=:\" comments+=f:\"
autocmd Filetype lua setlocal comments-=:-- comments+=f:--
autocmd Filetype c,cpp setlocal comments-=:// comments+=f://
" )))

" ((( Key mapping
nmap - <C-B>
nmap = <C-F>
" )))
