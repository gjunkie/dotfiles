source ~/.vim/config/statusline.vim

" File Encoding
set enc=utf-8

" Misc Settings
set wildignore+=*/tmp/*
set wildignore+=*/test/*
set wildignore+=*/vendor/assets/bower_components/*
set wildignore+=*/public/* 
set nonumber
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
autocmd BufNewFile,BufRead *.jsx set ft=javascript
autocmd BufNewFile,BufRead *.json setlocal ft=javascript
autocmd BufNewFile,BufRead *.less setlocal ft=less
autocmd BufNewFile,BufRead *.txt setlocal ft=rst

" To Dos
autocmd filetype taskpaper let g:auto_save = 1
autocmd filetype taskpaper :WatchForChanges!

augroup FiletypeGroup
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=js
augroup END

autocmd FileType javascript setlocal makeprg=lint\ --format\ compact
autocmd BufWritePost *.py,*.js silent make! <afile> | silent redraw!
autocmd QuickFixCmdPost [^l]* cwindow

" ColorScheme runs after the colorscheme has been loaded
autocmd ColorScheme *
  \ hi User1 ctermfg=007 |
  \ hi User2 ctermfg=008 |
  \ hi User3 ctermfg=008 |
  \ hi User4 ctermfg=008 |
  \ hi User5 ctermfg=008 |
  \ hi User7 ctermfg=008 |
  \ hi User8 ctermfg=008 |
  \ hi User9 ctermfg=007

let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

if !has('gui_running')
  set t_Co=256
endif

set term=xterm-256color
