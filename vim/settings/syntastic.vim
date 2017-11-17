" none of this is being used
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers  = ['eslint']
"let g:syntastic_javascript_eslint_exe = 'npm run eslint --'
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'
"let g:syntastic_javascript_eslint_exec = '/bin/ls'
"let g:syntastic_javascript_eslint_exe = '[ -f $(npm bin)/eslint ] && $(npm bin)/eslint || eslint'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
