" Global Key Mappings
" ---------------------------------
let mapleader=";"

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map r :redo<CR>
map <leader>r :%s:
map <Leader>m :ToggleMouse<CR>
nnoremap <silent> cf  :FufFileWithCurrentBufferDir<CR>
nnoremap <silent> <space> :CtrlPBuffer<CR>
nnoremap <silent> \ :CtrlP<CR>
nnoremap <leader>p :set pastetoggle<CR>
nnoremap <leader>c :nohl<CR>
nnoremap <Leader>t :noautocmd vimgrep /TODO/j **/*.coffee<CR>:cw<CR>
nnoremap <Leader>tr :ccl<CR>
nnoremap <Leader>to :cope<CR>
nnoremap n nzz
nnoremap N Nzz
" Navigate to wrappinng lines
nnoremap j gj
nnoremap k gk

" Normal State Key Mappings
" ---------------------------------
nmap <Tab> :tabnext<CR>
nmap <S-Tab> :tabprevious<CR>

" Visual State Key Mappings
" ---------------------------------
vmap <Tab> >gv
vmap <S-Tab> <gv

