" -------------------------------------
" General Mappings
" -------------------------------------

" Window Management
" -------------------------------------
nnoremap <Space>h <C-w>h
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
" Windown resizing
"nnoremap <C-K> :5wincmd +<CR> " Up
"nnoremap <C-J> :5wincmd -<CR> " Down
"nnoremap <C-H> :5wincmd <<CR> " Left
"nnoremap <C-L> :5wincmd ><CR> " Right
" Split windows verticall/horizontally
nnoremap + :vsp<CR>
nnoremap _ :sp<CR>
" Close current window
nnoremap qq :q<CR>

" Invoke help QuickFix windows
noremap HV :call CheatVim() <CR>
noremap HT :call CheatTmux() <CR>

" toggle mouse mode
map <Leader>m :ToggleMouse<CR>

" Toggle Filetree (netrw)
nmap <Tab> :call NetrwToggle("%:p:h")<CR>
nmap <S-Tab> :call NetrwToggle(getcwd())<CR>

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


" Plugins
" -------------------------------------

" Git
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

" DelimitMate
imap <C-l> <C-G>g

" FZF
nnoremap fs :Rg<SPACE>
nnoremap fw :Rg <C-R><C-W><CR>
vnoremap fw :Rg y/<C-R>"<CR>
nnoremap ff :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>
nnoremap f<Space> :b#<CR>
nnoremap ` :Buffers<CR>

" Buffer handling

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
