" Usin native netrw has been super buggy.

"let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'

"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :call VexToggle("")
"augroup END

"fun! VexToggle(dir)
  "if exists("t:vex_buf_nr")
    "call VexClose()
  "else
    "call VexOpen(a:dir)
  "endif
"endf

"fun! VexOpen(dir)
  "let g:netrw_altv = 1
  "let g:netrw_banner = 0
  "let g:netrw_browse_split = 4
  "let g:netrw_liststyle = 3
  "let vex_width = 35

  "execute "Vexplore" . a:dir
  "let t:vex_buf_nr = bufnr("%")
  "wincmd H

  "call VexSize(vex_width)
"endf

"fun! VexClose()
  "let cur_win_nr = winnr()
  "let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr)

  "1wincmd w
  "close
  "unlet t:vex_buf_nr

  "execute (target_nr -1) . "wincmd w"
  "call NormalizeWidths()
"endf

"fun! VexSize(vex_width)
  "execute "vertical resize" . a:vex_width
  "set winfixwidth
  "call NormalizeWidths()
"endf

"fun! NormalizeWidths()
  "let eadir_pref = &eadirection
  "set eadirection=hor
  "set equalalways! equalalways!
  "let &eadirection = eadir_pref
"endf
