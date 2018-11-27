" -------------------------------------
" fzf
" -------------------------------------
nnoremap fs :Rg<SPACE>
nnoremap fw :Rg <C-R><C-W><CR>
vnoremap fw :Rg y/<C-R>"<CR>
nnoremap ff :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>

" Buffer handling
nnoremap <Space> :Buffers<CR>
nnoremap <Leader><Space> :b#<CR>
