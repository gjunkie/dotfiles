" Status Line
" -------------------------------------

" Map Vim mode to custom identifiers
let g:currentmode={
    \'n'      : 'N ',
    \'no'     : 'N·Operator Pending ',
    \'v'      : 'V ',
    \'V'      : 'V·Line ',
    \'\<C-V>' : 'V·Block ',
    \'s'      : 'Select ',
    \'S'      : 'S·Line ',
    \'\<C-S>' : 'S·Block ',
    \'i'      : 'I ',
    \'R'      : 'R ',
    \'Rv'     : 'V·Replace ',
    \'c'      : 'Command ',
    \'cv'     : 'Vim Ex ',
    \'ce'     : 'Ex ',
    \'r'      : 'Prompt ',
    \'rm'     : 'More ',
    \'r?'     : 'Confirm ',
    \'!'      : 'Shell ',
    \'t'      : 'Terminal '
    \}

" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=006'
  endif

  return ''
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
