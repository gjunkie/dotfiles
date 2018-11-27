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
  \              [ 'shouldPrintBranch' ],
  \            ]
  \ },
  \ 'inactive': {
  \   'left': [
  \             [ 'mode', 'paste' ],
  \             [
  \               'filename',
  \             ]
  \           ],
  \   'right': [
  \              [ 'gitbranch' ],
  \            ]
  \ },
  \ 'component_function': {
  \   'shouldPrintBranch': 'LightLineBranchName',
  \   'gitbranch': 'PrintGitBranch',
  \   'relativepath': 'LightLineRelativePath',
  \   'filename': 'LightLineFileName'
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
  \ }
\ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}

function! LightLineRelativePath()
  let path = (winwidth(0) > 150) ? expand('%:f') : expand('%:t')
  return path
endfunction

function! LightLineFileName()
  let path = expand('%:t')
  return path
endfunction

function! LightLineBranchName()
  try
    if exists('*fugitive#head')
      let isWideEnough = winwidth(0) > 150
      if isWideEnough
        return PrintGitBranch()
      else
        return ''
      endif
    endif
  catch
  endtry
  return ''
  " let branch = (winwidth(0) > 100) ? fugitive#head() u'\uE0A0' : ''
  " return branch
endfunction

function! PrintGitBranch()
  let branch = fugitive#head()
  return branch !=# '' ? '⭠ '.branch : ''
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
