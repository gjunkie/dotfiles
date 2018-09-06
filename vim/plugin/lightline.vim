" lightline settings
" ---------------------------------

let g:lightline = {
  \ 'colorscheme': 'nord',
  \ 'active': {
  \   'left': [
  \             [ 'mode', 'paste' ],
  \             [
  \               'readonly',
  \               'relativepath',
  \               'modified',
  \             ]
  \           ],
  \   'right': [
  \              [
  \                'linter_errors',
  \                'linter_warnings',
  \                'linter_ok',
  \              ],
  \              [ 'gitbranch' ],
  \            ]
  \ },
  \ 'inactive': {
  \   'left': [
  \             [ 'mode', 'paste' ],
  \             [
  \               'relativepath',
  \             ]
  \           ],
  \   'right': [
  \            ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightLineBranchName',
  \   'relativepath': 'LightLineRelativePath'
  \ },
  \ 'component_expand': {
  \   'linter_warnings': 'LightlineLinterWarnings',
  \   'linter_errors': 'LightlineLinterErrors',
  \   'linter_ok': 'LightlineLinterOK'
  \ },
  \ 'component_type': {
  \    'linter_errors': 'error',
  \    'linter_warnings': 'warning',
  \    'linter_ok': 'ok',
  \    'gitbranch': 'warning'
  \ }
\ }

function! LightLineRelativePath()
  let path = (winwidth(0) > 100) ? expand('%') : expand('%:t')
  return path
endfunction

function! LightLineBranchName()
  let branch = (winwidth(0) > 100) ? fugitive#head() : ''
  return branch
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓' : ''
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

autocmd User ALELintPost call lightline#update()
