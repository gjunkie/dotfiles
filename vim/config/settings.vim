" General Settings
" -------------------------------------
let mapleader="`"

" Misc Settings
set enc=utf-8
set nonumber
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" set tags=./tags,tags;$HOME

let html_no_rendering=1
set backspace=indent,eol,start
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set hidden
set history=10000
set hlsearch
set incsearch
set ignorecase
set nobackup
set noerrorbells
set nofoldenable
set noshowmode
set noswapfile
set scrolloff=10
set smartcase
set undoreload=10000
set undolevels=1000

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

if !has('gui_running')
  set t_Co=256
endif

set term=xterm-256color

" set termguicolors
colorscheme nord

syntax enable
filetype plugin indent on
