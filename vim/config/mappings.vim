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

" ALT key + d, s
map ∂ :sp<cr>
map ß :vsp<cr>

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
" Window Handling
" -------------------------------------
nnoremap <C-H> <C-W>R " Rotate Windows Up/Left
nnoremap <C-L> <C-W>x " Move Current Window Down/Right
nnoremap + <C-w>v " Vertical split
nnoremap _ <C-w>s " Horizontal split

" -------------------------------------
" Toggle commenting
" -------------------------------------
nnoremap <silent>  C :set opfunc=comment#toggle_comment<cr>g@<Right>
vnoremap <silent>  C :<c-u>call comment#toggle_comment(visualmode(), 1)<cr>

" -------------------------------------
" vim-fugitive
" -------------------------------------
map <Leader>b :Gblame<CR>
map <Leader>d :Gdiff<CR>
map <Leader>\ :Gbrowse<CR>
map <Leader><Tab> :Gstatus<CR>
nmap ç :Commits<CR> "<Option-c>

" -------------------------------------
" Ale Linter
" -------------------------------------
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
"nmap <silent> <leader>aj :ALENext<cr>
"nmap <silent> <leader>ak :ALEPrevious<cr>

" -------------------------------------
" UndoTreeToggle
" -------------------------------------
nnoremap <silent> - :UndotreeToggle<cr>

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
nnoremap \ :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>

" -------------------------------------
" Buffer handling
" -------------------------------------
nnoremap <Space> :Buffers<CR>
nnoremap <Leader><Space> :b#<CR>

" -------------------------------------
" Vim Tabs
" -------------------------------------
nmap <S-t> :tabnew<CR>
nmap <leader>[ :tabp<CR>
nmap <leader>] :tabn<CR>

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
map r :redo<CR>
map RW :%s:<C-R><C-W>:
map RR :%s:
map <Leader>m :ToggleMouse<CR>

" -------------------------------------
" mucomplete
" -------------------------------------
" Changes behavior of Enter key to simply select highlighted
" options and close menu.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

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

fun! Cheat()
  " Add handy bindings you tend to forget or want to learn.
  echo "Vim__________________________________"
  echo "RR           Replace word"
  echo "RW           Replace word at cursor"
  echo "<C-h>        Rotate Windows Up"
  echo "<C-l>        Move Current Window Down"
  echo "<leader>\    Browse to github file"
  echo "<leader>d    Git diff"
  echo "<Options-c>  Git commits"
  echo " "
  echo "tmux_________________________________"
  echo "&            Close window"
endf

noremap H :call Cheat() <CR>
