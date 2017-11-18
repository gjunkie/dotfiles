" Global Key Mappings
" ---------------------------------
let mapleader="`"

" Easy window navigation
map <Leader>h <C-w>h
map <Leader>j <C-w>j
map <Leader>k <C-w>k
map <Leader>l <C-w>l
map r :redo<CR>
map <Leader>r :%s:
map <Leader>m :ToggleMouse<CR>

" vim-fugitive
map <Leader>b :Gblame<CR>
map <Leader>d :Gdiff<CR>
map <Leader>\ :Gbrowse<CR>
map <Leader><Tab> :Gstatus<CR>

" UndoTreeToggle
nnoremap <silent> - :UndotreeToggle<cr>

" nerdtree
nmap <Tab> :NERDTreeToggle<CR>
map <S-Tab> :NERDTreeFind<CR>

" fzf
nnoremap = :Find<SPACE>
nnoremap <silent> <Leader>= :Find <C-R><C-W><CR>
nmap \ :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>

nnoremap <Leader>p :set pastetoggle<CR>
nnoremap <Leader>t :noautocmd vimgrep /TODO/j **/*.coffee<CR>:cw<CR>
nnoremap <Leader>tr :ccl<CR>
nnoremap <Leader>to :cope<CR>

nmap <leader>t :set noet tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>s :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

nnoremap n nzz
nnoremap N Nzz
" Navigate to wrappinng lines
nnoremap j gj
nnoremap k gk

" Normal State Key Mappings
" ---------------------------------
" nmap <Tab> :tabnext<CR>
" nmap <S-Tab> :tabprevious<CR>

" Visual State Key Mappings
" ---------------------------------
vmap <Tab> >gv
vmap <S-Tab> <gv

nnoremap <S-c> :call NERDComment(0,"toggle")<CR>
vnoremap <S-c> :call NERDComment(0,"toggle")<CR>
