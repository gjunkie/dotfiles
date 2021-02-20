" Plugins
" -------------------------------------

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'gjunkie/vim-grid-color'

" fuzzy searcher
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Auto closing of quotes and such
Plug 'Raimondi/delimitMate'

" Syntax Highlighting
" Plugin 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'amadeus/vim-xml'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ianks/vim-tsx'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Linting
Plug 'w0rp/ale'

call plug#end()
