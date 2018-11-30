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
Plugin 'junegunn/fzf.vim'
" Auto closing of quotes and such
Plugin 'Raimondi/delimitMate'
" Language Pack for syntax highlighting
Plugin 'sheerun/vim-polyglot'
" Auto Complete suggestions
Plugin 'lifepillar/vim-mucomplete'

call vundle#end()
