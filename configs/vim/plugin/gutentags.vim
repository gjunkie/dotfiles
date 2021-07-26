" set statusline+=%{gutentags#statusline()}
" let g:gutentags_generate_on_empty_buffer=1
let g:gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g')
if g:gitroot !=# ''
  let g:gutentags_cache_dir = g:gitroot .'/.git/tags'
else
  let g:gutentags_cache_dir = $HOME .'/.cache/vim-tags'
endif
let g:gutentags_exclude_project_root = ['/usr/local', $HOME]
let g:gutentags_file_list_command = {
      \ 'markers': {
      \ '.git': 'git ls-files',
      \ },
      \ }
let g:gutentags_resolve_symlinks = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_trace = 1

