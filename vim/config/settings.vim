" General Settings
" -------------------------------------

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

set tags=./tags,tags;$HOME
" set tags=tags;/

set autoread
set backspace=indent,eol,start
set cmdheight=1
set enc=utf-8
set expandtab
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set hidden
set history=10000
set hlsearch
set incsearch
set ignorecase
set laststatus=2
set nobackup
set noerrorbells
set nofoldenable
set nonumber
set noshowmode
set noswapfile
set scrolloff=20
set shiftwidth=2
set smartcase
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set term=xterm-256color
set termguicolors
set undoreload=10000
set undolevels=1000

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create dirs
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  silent call system('mkdir -p ' . &undodir)
  set undofile
endif

colorscheme nord

set statusline=
set statusline+=%{ChangeStatuslineColor()}                 " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}     " Current mode
set statusline+=%8*\ %{expand('%:p:h:t')}/                 " directory of current file
set statusline+=%7*\%<%t\ %{ReadOnly()}%m\ %w\             " File
set statusline+=%*
set statusline+=%9*\ %=                                    " Space
set statusline+=%0*\ %l:%c\                                " Rownumber/total (%)

if !has('gui_running')
  set t_Co=256
endif
