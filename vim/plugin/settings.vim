" File Encoding
set enc=utf-8

" Misc Settings
set wildignore+=*/tmp/*
set wildignore+=*/test/*
set wildignore+=*/vendor/assets/bower_components/*
set wildignore+=*/public/*

" Status bar and Linenumbers
"  Make the command line two lines high and change the statusline display to
"  something that looks useful.
set cmdheight=1
set laststatus=2
set nonumber

"set statusline=%t       "tail of the filename
"set statusline+=%h      "help file flag
"set statusline+=%m      "modified flag
"set statusline+=%r      "read only flag
"set statusline+=%=      "left/right separator
"set statusline+=%c,     "cursor column
"set statusline+=%l/%L   "cursor line/total lines
"set statusline+=\ %P    "percent through file
"set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}] "file encoding
"set statusline+=%{&ff}] "file format
"set statusline+=%y      "filetype
"set statusline+=%f       "path of file
"set statusline=%{fugitive#statusline()}

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set tags=./tags,tags;$HOME

" Final Settings
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
set visualbell

" Set File Types
autocmd BufNewFile,BufRead *.html setfiletype html
autocmd BufNewFile,BufRead *.hbs setfiletype html
autocmd BufNewFile,BufRead *.haml setfiletype html
autocmd BufNewFile,BufRead *.jst setfiletype html
autocmd BufNewFile,BufRead *.master setfiletype html
autocmd BufNewFile,BufRead *.aspx setfiletype html
autocmd BufNewFile,BufRead *.ascx setfiletype html
autocmd BufNewFile,BufRead *.ejs setfiletype html
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd BufNewFile,BufRead *.less setlocal ft=less
autocmd BufNewFile,BufRead *.txt setlocal ft=rst

" To Dos
autocmd filetype taskpaper let g:auto_save = 1
autocmd filetype taskpaper :WatchForChanges!

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

if !has('gui_running')
  set t_Co=256
endif
