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

" Windown resizing
"nnoremap <C-K> :5wincmd +<CR> " Up
"nnoremap <C-J> :5wincmd -<CR> " Down
"nnoremap <C-H> :5wincmd <<CR> " Left
"nnoremap <C-L> :5wincmd ><CR> " Right

" Window Handling
nnoremap <C-H> <C-W>R " Rotate Windows Up/Left
nnoremap <C-L> <C-W>x " Move Current Window Down/Right
nnoremap + <C-w>v " Vertical split
nnoremap _ <C-w>s " Horizontal split
