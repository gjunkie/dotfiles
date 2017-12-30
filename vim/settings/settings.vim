" File Encoding
set enc=utf-8

syntax enable

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
set number

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

" Tab Settings
" set shiftwidth=2 tabstop=2 softtabstop=2 expandtab smartindent!
" autocmd BufNewFile,BufRead ~/Sites/opal/* set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
"set tabstop=2
"set softtabstop=2
set shiftwidth=2
set expandtab

" Final Settings
let html_no_rendering=1
let g:indent_guides_auto_colors = 0
let g:mustache_abbreviations = 1
set scrolloff=10
set hlsearch
set incsearch
set nobackup
set noswapfile
set ignorecase
set smartcase
set hidden
set history=10000
set undoreload=10000
set undolevels=1000
set visualbell
set noerrorbells
set backspace=indent,eol,start
set noshowmode

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
