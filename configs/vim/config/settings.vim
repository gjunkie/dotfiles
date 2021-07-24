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
" set nonumber
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
set wildignore+=node_modules

set diffopt+=iwhiteall
set diffopt+=hiddenoff
set diffopt+=internal,algorithm:patience

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

try
  colorscheme iceberg
catch /^Vim\%((\a\+)\)\=:E185/
endtry

if !has('gui_running')
  set t_Co=256
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" set splitbelow         " Always split below
" " set mouse=a            " Enable mouse drag on window splits
" augroup myterm | au!
"     au TermOpen * if &buftype ==# 'terminal' | resize 20 | vert resize 40 | endif
" augroup end

" Function to source only if file exists
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
