" General Settings
" -------------------------------------
" let mapleader="`"

" Misc Settings
set enc=utf-8
set nonumber
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set tags=./tags,tags;$HOME
" set tags=tags;/

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

set cmdheight=1
set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}                 " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}     " Current mode
set statusline+=%8*\ %{expand('%:p:h:t')}/                 " directory of current file
set statusline+=%7*\%<%t\ %{ReadOnly()}%m\ %w\             " File
set statusline+=%*
set statusline+=%9*\ %=                                    " Space
set statusline+=%0*\ %l:%c\                                " Rownumber/total (%)

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
