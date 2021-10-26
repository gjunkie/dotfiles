" fzf settings
" ---------------------------------

" Pass an empty option dictionary if the screen is narrow

set rtp+=/usr/local/bin/fzf
let g:fzf_layout = { 'up': '100%' }
let g:fzf_preview_window = ['up:60%', 'ctrl-/']

let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }

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
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)


command! -bang -nargs=* Ag
  \ call fzf#vim#grep(
  \   'ag --depth -1 --column --path-to-ignore ~/.fzf.ignore --smart-case '.shellescape(<q-args>),
  \   0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0] }), <bang>0)

nnoremap <leader>v :FzfFiles<cr>
nnoremap <leader>u :FzfTags<cr>
nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
