" Plugins
" -------------------------------------

set nocompatible
filetype off

" Vundle setup
silent! set rtp+=~/.vim/bundle/Vundle.vim
silent! call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" fzf - fuzzy searcher
Plugin 'junegunn/fzf'
" fzf - fuzzy searcher for vim
Plugin 'junegunn/fzf.vim'
" CoffeeScript syntax, indent, etc support
Plugin 'kchmck/vim-coffee-script'
" Smart undo history
Plugin 'mbbill/undotree'
" Indent guides
Plugin 'nathanaelkane/vim-indent-guides'
" Auto closing of quotes and such
Plugin 'Raimondi/delimitMate'
" Language Pack for syntax highlighting
Plugin 'sheerun/vim-polyglot'
" File tree
Plugin 'scrooloose/nerdtree'
" Auto Complete suggestions
Plugin 'lifepillar/vim-mucomplete'

" Autosave taskpaper files
Plugin 'davidoc/taskpaper.vim'
Plugin 'vim-scripts/vim-auto-save'

call vundle#end()

" Icebox
" Ale linter
" Plugin 'w0rp/ale'
" Lightline status line
" Plugin 'itchyny/lightline.vim'
