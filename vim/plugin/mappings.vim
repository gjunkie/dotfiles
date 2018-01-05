" Global Key Mappings
" ---------------------------------
let mapleader="`"

" -------------------------------------
" Easy window navigation
" -------------------------------------
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l
" ALT key + j, k, l, h
nnoremap ª <C-W><C-J>
nnoremap º <C-W><C-K>
nnoremap ¬ <C-W><C-L>
nnoremap ˙ <C-W><C-H>

" -------------------------------------
" Windown resizing
" -------------------------------------
"nnoremap <C-K> :5wincmd +<CR> " Up
"nnoremap <C-J> :5wincmd -<CR> " Down
"nnoremap <C-H> :5wincmd <<CR> " Left
"nnoremap <C-L> :5wincmd ><CR> " Right

" -------------------------------------
" Window reordering
" -------------------------------------
nnoremap <C-H> <C-W>R " Rotate Windows Up/Left
nnoremap <C-L> <C-W>x " Move Current Window Down/Right

" -------------------------------------
" vim-fugitive
" -------------------------------------
map <Leader>b :Gblame<CR>
map <Leader>d :Gdiff<CR>
map <Leader>\ :Gbrowse<CR>
map <Leader><Tab> :Gstatus<CR>
nmap ç :Commits<CR> "<Option-c>

" -------------------------------------
" UndoTreeToggle
" -------------------------------------
nnoremap <silent> - :UndotreeToggle<cr>

" -------------------------------------
" NERDComment
" -------------------------------------
nnoremap <S-c> :call NERDComment(0,"toggle")<CR>
vnoremap <S-c> :call NERDComment(0,"toggle")<CR>

" -------------------------------------
"NERDTree
" -------------------------------------
nmap <Tab> :NERDTreeToggle<CR>
map <S-Tab> :NERDTreeFind<CR>

" -------------------------------------
" fzf
" -------------------------------------
nnoremap F :Find<SPACE>
nnoremap K :Find <C-R><C-W><CR>
nnoremap <Space> :Buffers<CR>
nnoremap \ :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>

" -------------------------------------
" Vim Tabs
" -------------------------------------
nmap <S-t> :tabnew<CR>
nmap 1 :tabp<CR>
nmap 2 :tabn<CR>

" -------------------------------------
" Tabs/Spaces
" -------------------------------------
nmap <leader>tt :set noet tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>ss :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" -------------------------------------
" Text search within buffer
" -------------------------------------
nmap ? /<C-R><C-W><CR>
nnoremap n nzz
nnoremap N Nzz

" -------------------------------------
" Misc
" -------------------------------------
"nnoremap <Leader>p :set pastetoggle<CR>
map r :redo<CR>
map <Leader>rw :%s:<C-R><C-W>:
map <Leader>rr :%s:
map <Leader>m :ToggleMouse<CR>
imap qq <ESC>
vmap qq <ESC>

" -------------------------------------
" Navigate to wrappinng lines
" -------------------------------------
nnoremap j gj
nnoremap k gk

" -------------------------------------
" Visual State Key Mappings
" -------------------------------------
vmap <Tab> >gv
vmap <S-Tab> <gv

