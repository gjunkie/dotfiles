" ale settings
" ---------------------------------

" let g:ale_lint_delay=1
let g:ale_lint_on_save=1
let g:ale_lint_on_text_changed="always"
let g:ale_lint_on_insert_leave=1

let g:ale_fixers = {'javascript': ['eslint']}
let g:ale_fix_on_save = 1
" let g:ale_lint_on_enter=1

" let g:ale_set_quickfix=1

" Enable ESLint only for JavaScript.
let b:ale_linters = {'javascript': ['eslint']}

" Only run linters named in ale_linters settings.
" let g:ale_linters_explicit = 1

let g:ale_sign_error = 'X'
let g:ale_sign_warning = '!'
