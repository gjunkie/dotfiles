" Snippets are collected in plain text files named after the file type.
" Example snippet:
"
" snippet for
" for (___) {
"   ___
" }
"
" A snippet definition starts with the `snippet' keyword followed by the name
" of the snippet (for). The remaining lines contain the text that must be put
" (verbatim) into the buffer (see the snippets folder for other examples).
"
" Three underscore are used for placeholders. At least one placeholder must be
" present. The cursor is put at the first placeholder after expanding the
" snippet. You can jump to the next placeholder by pressing ctrl-b in Insert
" mode.
"
" To expand a snippet, type its name followed by … (alt-. in macOS).
fun! js#load_snippets()
  " let l:file = readfile($HOME.'/.vim/snippets/'.&ft.'.txt')
  let l:file = readfile($HOME.'/.vim/snippets/js.txt')
  let b:lf_snippets = {}
  for l:line in l:file
    if l:line =~ '^snippet'
      let l:key = matchstr(l:line, '^snippet\s\+\zs.\+$')
      let b:lf_snippets[l:key] = []
    elseif !empty(l:line)
      call add(b:lf_snippets[l:key], l:line)
    endif
  endfor
  " Start inserting at the next placeholder
  inoremap <buffer> <c-b> <esc>gn"_c
endf

fun! js#expand_snippet()
  if !exists('b:lf_snippets') | return '…' | endif
  " Get word in front of the cursor and tail of line
  let l:match = matchlist(getline('.'), '\(\S\+\%'.col('.').'c\)\(.*\)$')
  if empty(l:match) | return '…' | endif
    let [l:key, l:tail] = [l:match[1], l:match[2]]
    let l:snippet = get(b:lf_snippets, l:key, [])
  if !empty(l:snippet) " Expand snippet
    let l:indent = matchstr(getline('.'), '^\s\+')
    call setline('.', l:indent . l:snippet[0])
    call append('.', map(l:snippet[1:-1], { _,t -> l:indent . t}))
    call search('___')
    let l:save_cursor = getcurpos()
    " Enable searching for ___ with // and ?? and replacing the next ___ with gnc:
    let @/ = '___'
    execute '.s/\(\s\?\)___/\1'.l:tail.'/'
    call setpos('.', l:save_cursor)
    return ''
  endif
  return '…'
endf

" This should be in the ftplugin for js files, but
" jsx files are loading as javascript.jsx and this
" fails to load
call js#load_snippets()
