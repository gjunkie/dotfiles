
let g:ctrlp_working_path_mode = '0'

let g:ctrlp_max_files=0

" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.yardoc\|public$|log\|tmp$',
	\ 'file': '\.so$\|\.dat$|\.DS_Store$'
	\ }

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

let g:ctrlp_user_command = ['.git/', 'git ls-files --cached --others  --exclude-standard %s']

"let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
