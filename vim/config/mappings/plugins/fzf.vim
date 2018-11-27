" -------------------------------------
" fzf
" -------------------------------------
nnoremap F :Rg<SPACE>
nnoremap K :Rg <C-R><C-W><CR>
vnoremap K :Rg y/<C-R>"<CR>
nnoremap \ :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>
