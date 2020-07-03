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

let s:fzf_options = "--multi --tabstop 4 --no-reverse --no-margin
      \ --preview '[[ $(file --mime {}) =~ binary ]] &&
      \ echo {} is a binary file || (head -18 {})' --preview-window up:40%"

" search
" let s:rg_command = 'rg --ignore-case --hidden --follow --color never
"       \ --column --line-number --no-heading --fixed-strings
"       \ --ignore ' .
"       \ (filereadable('.rgignore') ? '--ignore-file ".rgignore"' : '')
"
" command! -bang -nargs=* Rg
"       \ call fzf#vim#grep(s:rg_command.shellescape(<q-args>), 1,
"       \ fzf#vim#with_preview({'options': '--delimiter : --nth 4..'},
"       \ 'up:40%'), <bang>0)

" files
" Pass an empty option dictionary if the screen is narrow
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, &columns > 80 ? fzf#vim#with_preview() : {}, <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 0, { 'options': '--color hl:195,hl+:195,fg+:008,fg:250,prompt:195' }, 0)

" let $BAT_THEME = 'TwoDark'
" command! -bang -nargs=* Rg
"   \ call fzf#vim#grep('rg --column --no-heading --line-number --color=always '.shellescape(<q-args>),
"   \ 1,
"   \ fzf#vim#with_preview(),
"   \ <bang>0)


" let s:files_source = 'fd -HLp -t f -c never'
" command! -nargs=* -complete=file_in_path Files call     fzf#run(fzf#wrap('files',
"       \ {'source': s:files_source.shellescape(<q-args>),
"       \ 'options': s:fzf_options}, 0))
