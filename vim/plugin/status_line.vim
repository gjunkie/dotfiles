" Status Line
" -------------------------------------

" Map Vim mode to custom identifiers
let g:currentmode={
    \'n'      : 'NORMAL',
    \'no'     : 'N·Operator Pending',
    \'v'      : 'VISUAL',
    \'V'      : 'V·Line',
    \'\<C-V>' : 'V·Block',
    \'s'      : 'Select',
    \'S'      : 'S·Line',
    \'\<C-S>' : 'S·Block',
    \'i'      : 'INSERT',
    \'R'      : 'REPLACE',
    \'Rv'     : 'V·Replace',
    \'c'      : 'Command',
    \'cv'     : 'Vim Ex',
    \'ce'     : 'Ex',
    \'r'      : 'Prompt',
    \'rm'     : 'More',
    \'r?'     : 'Confirm',
    \'!'      : 'Shell',
    \'t'      : 'Terminal'
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    hi StatusLine ctermfg=16 ctermbg=195
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    hi StatusLine ctermfg=16
  elseif (mode() ==# 'i')
    hi StatusLine ctermfg=16 ctermbg=214
  else
    hi StatusLine ctermfg=006
  endif

  return ''
endfunction

function! LinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error

  if !l:all_errors
    return ''
  endif

  if l:all_errors == 1
    return printf(
    \   '%d Error',
    \   all_errors
    \)
  endif

  return printf(
  \   '%d Errors',
  \   all_errors
  \)
endfunction

function! LinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  if !l:all_non_errors
    return ''
  endif

  if l:all_non_errors == 1
    return printf(
    \   '%d Warning',
    \   all_non_errors,
    \)
  endif

  return printf(
  \   '%d Warnings',
  \   all_non_errors,
  \)
endfunction

function! LinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  if !l:all_errors && !l:all_non_errors
    return 'OK'
  else
    return ''
  endif
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return ''
  else
    return ''
endfunction

" This code seems to have a strange effect.
" It glitches out some charaters when navigating.
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction
" 
function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%{ChangeStatuslineColor()}                          " Changing the statusline color
set statusline+=%*\ %{toupper(g:currentmode[mode()])}\              " Current mode
set statusline+=%*
set statusline+=%3*\ %{expand('%:p:h:t')}/                          " Directory of current file
set statusline+=%3*%<%t%w\                                          " File name
set statusline+=%9*%<%m                                             " Modified
set statusline+=%3*%{ReadOnly()}                                    " Read Only icon
set statusline+=%*
set statusline+=%1*\ %=                                             " Space
set statusline+=%6*\ %l:%c\                                         " Row:Column
" set statusline+=%2*%{strlen(LinterOK())==2?LinterOK():''}
set statusline+=%8*%{strlen(LinterWarnings())>0?LinterWarnings():''}
set statusline+=%9*%{strlen(LinterErrors())>0?LinterErrors():''}
set statusline+=%*

function! LinteNotOk()
  if strlen(LinterWarnings()) > 0
    set statusline+=%8*\ %{LinterWarnings()}\                     " Linter warning
  endif
  echom len(LinterErrors())
  if strlen(LinterErrors()) > 0
    set statusline+=%9*\ %{LinterErrors()}\                       " Linter errors
  endif
endfunction

" au InsertEnter * call UpdateErrors()
" au InsertChange * call UpdateErrors()
" au InsertLeave * call UpdateErrors()

au InsertEnter * call ChangeStatuslineColor()
au InsertChange * call ChangeStatuslineColor()
au InsertLeave * call ChangeStatuslineColor()
" au InsertLeave * hi statusline guibg=green
