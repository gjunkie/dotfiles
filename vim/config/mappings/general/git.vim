" -------------------------------------
" Git
" -------------------------------------

nnoremap gb :Blame<CR>
xnoremap g\ :<c-u>call git#OpenCurrentFileInGithub()<cr>
noremap g\ V:<c-u>call git#OpenCurrentFileInGithub()<cr>

" nnoremap <silent> <leader>b :execute "terminal tig blame +" . line(".") . " -- " . expand("%")<CR>
" noremap <leader>b :vsp :execute "term git blame -L " . eval(line(".")-5) . ",+10 %"<cr>
"
" function! s:Blame(bufnr, filename, ...)
"   let view = winsaveview()
"   normal! gg
"   let width = get(a:000, 0, 40)
"   execute 'leftabove ' . width . 'vnew'
"   set buftype=nofile
"   set bufhidden=wipe
"   set nowrap
"   set noswapfile
"   execute 'autocmd BufWipeout <buffer> call setbufvar(' . a:bufnr .', "&scrollbind", 0)'
"   execute 'read!git blame ' . shellescape(a:filename)
"   0delete _
"   set scrollbind
"   wincmd p
"   set scrollbind
"   call winrestview(view)
" endfunction

