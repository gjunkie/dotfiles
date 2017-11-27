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
nnoremap <S-c> :call NERDComment(0,"toggle")<CR>
vnoremap <S-c> :call NERDComment(0,"toggle")<CR>

" fzf
nnoremap F :Find<SPACE>
nnoremap K :Find <C-R><C-W><CR>
nnoremap <Space> :Buffers<CR>
nnoremap \ :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>

" Normal State Key Mappings
" ---------------------------------
" Vim Tabs
nmap <S-t> :tabnew<CR>
nmap 1 :tabp<CR>
nmap 2 :tabn<CR>
" Tabs/Spaces
nmap <leader>tt :set noet tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>ss :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>


nnoremap <Leader>p :set pastetoggle<CR>
nnoremap n nzz
nnoremap N Nzz
" Navigate to wrappinng lines
nnoremap j gj
nnoremap k gk

" Visual State Key Mappings
" ---------------------------------
vmap <Tab> >gv
vmap <S-Tab> <gv
