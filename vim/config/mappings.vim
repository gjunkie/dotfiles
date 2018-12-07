" -------------------------------------
" General Mappings
" -------------------------------------

" Window Management
" -------------------------------------
nnoremap fh <C-w>h
nnoremap fj <C-w>j
nnoremap fk <C-w>k
nnoremap fl <C-w>l
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

" smooth scrolling
nnoremap <silent> <C-u> :call scroll#SmoothScroll(1)<cr>
nnoremap <silent> <C-d> :call scroll#SmoothScroll(0)<cr>

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

" Git helpers utilizing Tig
nnoremap gb :Blame<CR>
nnoremap gc :Commits<CR>
xnoremap g\ :<c-u>call git#OpenCurrentFileInGithub()<cr>
noremap g\ V:<c-u>call git#OpenCurrentFileInGithub()<cr>

" Plugins
" -------------------------------------

" DelimitMate
imap <C-l> <C-G>g

" FZF
nnoremap fs :Rg<SPACE>
nnoremap fw :Rg <C-R><C-W><CR>
vnoremap fw :<C-U>Rg y/<C-R>"<CR>
nnoremap ff :call fzf#run(fzf#wrap({'source': 'git ls-files --exclude-standard --others --cached'}))<CR>
nnoremap fb :Buffers<CR>
nnoremap f<Space> :b#<CR>
