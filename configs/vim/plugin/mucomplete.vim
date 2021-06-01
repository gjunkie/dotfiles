" Mucomplete settings
" ---------------------------------

fun! CompleteLog(findstart, base)
  if a:findstart
    " locate the start of the word
    let line = getline('.')
    let start = col('.') - 1
    while start > 0 && line[start - 1] =~ '\a'
      let start -= 1
    endwhile
    return start
  else
    " find words matching with "a:base"
    let res = []
    let l:file = readfile($HOME.'/.vim/snippets/js.txt')
    let l:snippets = []
    for l:line in l:file
      if l:line =~ '^snippet'
        let l:key = matchstr(l:line, '^snippet\s\+\zs.\+$')
      elseif !empty(l:line)
        call add(l:snippets, l:key)
      endif
    endfor
    for m in l:snippets
      if m =~ '^' . a:base
        call add(res, m)
      endif
    endfor
    return res
  endif
endfun

set completeopt+=menu,menuone
" set completefunc=CompleteLog
autocmd CompleteDone * call js#expand_snippet()

" Ccompletion Chains
" ---------------------------------
let g:mucomplete#chains = {
  \'default':  ['keyp', 'keyn'],
  \'coffee':  ['user', 'keyp', 'keyn'],
  \'javascript':  ['user', 'keyp', 'keyn'],
  \'rb':  ['keyp', 'keyn'],
  \}

let g:mucomplete#completion_delay = 350
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#popup_direction = { 'keyp' : 1, 'keyn' : 1 }
let g:mucomplete#reopen_immediately = 1
" let g:mucomplete#spel#max = 15
