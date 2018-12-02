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

" function! s:fzf_insert(data)
"   execute 'normal!' (empty(s:fzf_query) ? 'a' : 'ciW')."\<C-R>=a:data\<CR>"
"   startinsert!
" endfunction
"
" function! s:fzf_words(query)
"   let s:fzf_query = a:query
"   let matches = fzf#run({
"   \ 'source':  'cat /usr/share/dict/words',
"   \ 'sink':    function('s:fzf_insert'),
"   \ 'options': '--no-multi --query="'.escape(a:query, '"').'"',
"   \ 'down':    '40%'
"   \ })
" endfunction

" inoremap <silent> <C-n> <C-o>:call <SID>fzf_words(expand('<cWORD>'))<CR>
