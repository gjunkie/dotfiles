" -------------------------------------
" General Mappings
" -------------------------------------

" Invoke help QuickFix windows
noremap HV :call CheatVim() <CR>
noremap HT :call CheatTmux() <CR>

" toggle mouse mode
map <Leader>m :ToggleMouse<CR>

nnoremap r :redo<CR>

" replace word
map RR :%s:

" replace cursor word
map RW :%s:<C-R><C-W>:

" search cursor word in buffer
nmap ? /<C-R><C-W><CR>

" next search result in buffer
nnoremap n nzz

" previous search result in buffer
nnoremap N Nzz

" navigate to wrappinng lines
nnoremap j gj
nnoremap k gk

" toggle commenting
nnoremap <silent>  C :set opfunc=comment#toggle_comment<cr>g@<Right>
vnoremap <silent>  C :<c-u>call comment#toggle_comment(visualmode(), 1)<cr>

" indentation
vmap <Tab> >gv
vmap <S-Tab> <gv

" Spacing (tabs and spaces)
nmap <leader>tt :set noet tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>ss :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Vim Tabs
nmap <S-t> :tabnew<CR>
nmap <leader>[ :tabp<CR>
nmap <leader>] :tabn<CR>
