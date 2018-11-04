let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_loc_list_height = 10
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '✖'
let g:syntastic_warning_symbol = '!'
let g:syntastic_style_warning_symbol = '!'
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 1
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = {'mode': 'active', 'passive_filetypes': ['go']}
