" Plugins
" -------------------------------------

" Vundle setup
silent! set rtp+=~/.vim/bundle/Vundle.vim
silent! call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" fuzzy searcher
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
" Auto closing of quotes and such
Plugin 'Raimondi/delimitMate'
" Language Pack for syntax highlighting
" Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'amadeus/vim-jsx'
Plugin 'amadeus/vim-xml'
" Plugin 'MaxMEllon/vim-jsx-pretty'
" Auto Complete suggestions
Plugin 'lifepillar/vim-mucomplete'
" Linting
Plugin 'w0rp/ale'
" Auto Complete suggestions
Plugin 'gjunkie/vim-grid-color'

call vundle#end()
