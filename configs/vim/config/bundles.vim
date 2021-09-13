" Plugins
" -------------------------------------

call plug#begin('~/.vim/plugged')

" Colorschemes
Plug 'cocopon/iceberg.vim'
Plug 'gjunkie/vim-grid-color'
Plug 'sonph/onehalf', { 'rtp': 'vim' }

" fuzzy searcher
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" ctags
" Plug 'ludovicchabant/vim-gutentags'
" Plug 'zackhsi/fzf-tags'

Plug 'Raimondi/delimitMate'

" Syntax Highlighting
" Plugin 'sheerun/vim-polyglot'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'amadeus/vim-xml'
Plug 'pangloss/vim-javascript'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'ianks/vim-tsx'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': 'yarn install --frozen-lockfile'}
Plug 'scalameta/nvim-metals'

Plug 'antoinemadec/coc-fzf'

" Plug 'janko/vim-test'

" Linting
Plug 'w0rp/ale'

Plug 'vimwiki/vimwiki'

call plug#end()
