" fzf settings
" ---------------------------------

" Pass an empty option dictionary if the screen is narrow

set rtp+=/usr/local/bin/fzf
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
    \ { 'fg':      ['fg', 'Comment'],
      \ 'bg':      ['bg', 'PmenuSbar'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'Normal'],
      \ 'bg+':     ['bg', 'PmenuSbar'],
      \ 'hl+':     ['fg', 'Keyword'],
      \ 'info':    ['fg', 'Statement'],
      \ 'border':  ['fg', 'VertSplit'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Statement'],
      \ 'marker':  ['fg', 'Special'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Keyword'] }

" FZF stuff
let g:fzf_action = {'ctrl-s': 'split', 'ctrl-v': 'vsplit'}
let g:fzf_history_dir = '~/.fzf-history'
let g:fzf_buffers_jump = 1
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules'

let s:fzf_options = "--multi --tabstop 4 --no-reverse --no-margin
      \ --preview '[[ $(file --mime {}) =~ binary ]] &&
      \ echo {} is a binary file || (head -18 {})' --preview-window up:40%"

" search

" files
" Pass an empty option dictionary if the screen is narrow
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, &columns > 80 ? fzf#vim#with_preview() : {}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --colors "match:fg:166" --colors "path:fg:240" --colors "line:fg:195" --colors "column:fg:195" --smart-case '.shellescape(<q-args>),
  \   0,
  \   { 'options': '--color hl:195,hl+:195,fg+:195,fg:246,prompt:195' }, 0)

nnoremap <leader>v :FzfFiles<cr>
nnoremap <leader>u :FzfTags<cr>
nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
