" -------------------------------------
" General Mappings
" -------------------------------------
let mapleader = ","

" Window Management
" -------------------------------------
nnoremap fh <C-w>h
nnoremap fj <C-w>j
nnoremap fk <C-w>k
nnoremap fl <C-w>l
nnoremap fp <C-w><C-p>

" Neovim Terminal Control
nnoremap tt :terminal<CR>

" Toggle terminal on/off (neovim)
nnoremap <C-e> :call TermToggle(13)<CR>
inoremap <C-e> <Esc>:call TermToggle(12)<CR>
tnoremap <C-e> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Windown resizing
nnoremap = :vertical resize +5<CR>
nnoremap - :vertical resize -5<CR>
" nnoremap <C-H> :5wincmd <<CR> " Left
" nnoremap <C-L> :5wincmd ><CR> " Right
" Split windows verticall/horizontally
nnoremap + :vsp<CR>
nnoremap _ :sp<CR>
" Close current window
nnoremap qq :q<CR>

" Invoke help QuickFix windows
noremap HV :call CheatVim() <CR>
noremap HT :call CheatTmux() <CR>

" Toggle Filetree (netrw)
nnoremap <Tab> :call NetrwToggle("%:p:h")<CR>
nnoremap <S-Tab> :call NetrwToggle(getcwd())<CR>

nnoremap r :redo<CR>

" replace word
nnoremap RR :%s:
" replace cursor word
nnoremap RW :%s:<C-R><C-W>:

" move lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
nnoremap J :m .+1<CR>==
nnoremap K :m .-2<CR>==
inoremap <C-j> :m .+1<CR>==
inoremap <C-k> :m .-2<CR>==

" search cursor word in buffer
nnoremap ? /<C-R><C-W><CR>
" next search result in buffer
nnoremap n nzz
" previous search result in buffer
nnoremap N Nzz

" navigate to wrappinng lines
nnoremap j gj
nnoremap k gk

" move lines without dd
nnoremap <C-k> :m-2<CR>
nnoremap <C-j> :m+<CR>
vnoremap <C-k> :m '<-2<CR>gv=gv
vnoremap <C-j> :m '>+1<CR>gv=gv

" toggle commenting
nnoremap <silent>  C :set opfunc=comment#toggle_comment<cr>g@<Right>
vnoremap <silent>  C :<c-u>call comment#toggle_comment(visualmode(), 1)<cr>

" smooth scrolling
" nnoremap <silent> <C-u> :call scroll#SmoothScroll(1)<cr>
" nnoremap <silent> <C-d> :call scroll#SmoothScroll(0)<cr>

" indentation
vmap <Tab> >gv
vmap <S-Tab> <gv

" Completion list
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <silent><expr> <NUL> coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Spacing (tabs and spaces)
nmap <leader>tt :set noet tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>ss :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>

" Vim Tabs
nmap <S-t> :tabnew<CR>
nmap <leader>[ :tabp<CR>
nmap <leader>] :tabn<CR>

" Git helpers
xnoremap g\ :<c-u>call git#OpenCurrentFileInGithub()<CR>
noremap g\ V:<c-u>call git#OpenCurrentFileInGithub()<CR>

" Plugins
" -------------------------------------

" DelimitMate
imap <C-l> <C-G>g

" FZF
nnoremap fs :Rg<SPACE>
nnoremap fw :Rg <C-R><C-W><CR>
vnoremap fw y:Rg <c-r>"<CR>
nnoremap ff :Files<CR>
nnoremap FF :Files %:p:h<CR>
nnoremap FL :Lines<CR>
nnoremap FB :BLines<CR>
nnoremap fb :Buffers<CR>
nnoremap f<Space> :b#<CR>
nnoremap gs :GFiles?<CR>
nnoremap gb :Blame<CR>
nnoremap gc :BCommits<CR>
nnoremap gac :Commits!<CR>

" Code navigation
nmap <silent> fd <Plug>(coc-definition)
nmap <silent> fy <Plug>(coc-type-definition)
nmap <silent> fi <Plug>(coc-implementation)
nmap <silent> fr <Plug>(coc-references)

" ALE Linter
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" check the type under cursor w/ leader T

set updatetime=300

" Vim Test Mappings
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>

" Vim Wiki
nnoremap <Leader>ww :VimwikiIndex<CR>

" " Copy to clipboard
vnoremap  <leader>y "+y
nnoremap  <leader>Y :"+yg_<CR>
nnoremap  <leader>y :"+y<CR>
nnoremap  <leader>yy :"+yy<CR>

" " Paste from clipboard
" nnoremap <leader>p "+p
" nnoremap <leader>P "+P
" vnoremap <leader>p "+p
" vnoremap <leader>P "+P


"-----------------------------------------------------------------------------
" completion-nvim settings
"-----------------------------------------------------------------------------
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
