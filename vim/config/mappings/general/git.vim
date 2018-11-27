" -------------------------------------
" Git
" -------------------------------------

" map <Leader>b <C-w>n<C-w>H :0 r !git blame #<CR>
function! s:Blame(bufnr, filename, ...)
  execute "terminal tig blame +" . line(".") . " -- " . a:filename
endfunction
command! -count Blame call s:Blame(bufnr('%'), expand('%:p'), <f-args>)

" nnoremap <silent> <leader>b :execute "terminal tig blame +" . line(".") . " -- " . expand("%")<CR>
" nnoremap <silent> <leader>b :call Blame(bufnr('%'), expand('%:p'))<CR>
nnoremap <silent> <leader>b :Blame<CR>
noremap <silent> <leader>\ V:<c-u>call OpenCurrentFileInGithub()<cr>
xnoremap <silent> <leader>\ :<c-u>call OpenCurrentFileInGithub()<cr>

" noremap <leader>b :vsp :execute "term git blame -L " . eval(line(".")-5) . ",+10 %"<cr>
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

