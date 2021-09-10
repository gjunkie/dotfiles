let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 1
let g:netrw_winsize = 25
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'

fun! NetrwToggle(dir)
  if exists("t:vex_buf_nr")
    call NetrwClose()
  else
    call NetrwOpen(a:dir)
  endif
endf

fun! NetrwOpen(dir)
  let vex_width = 45
  execute "Vexplore" . a:dir
  let t:vex_buf_nr = bufnr("%")
  wincmd H

  call NetrwSize(vex_width)
endf

fun! NetrwClose()
  let cur_win_nr = winnr()
  let target_nr = ( cur_win_nr == 1 ? winnr("#") : cur_win_nr)

  1wincmd w
  close
  unlet t:vex_buf_nr

  execute (target_nr -1) . "wincmd w"
  call NormalizeWidths()
endf

fun! NetrwSize(vex_width)
  execute "vertical resize" . a:vex_width
  set winfixwidth
  call NormalizeWidths()
endf

fun! NormalizeWidths()
  let eadir_pref = &eadirection
  set eadirection=hor
  set equalalways! equalalways!
  let &eadirection = eadir_pref
endf

" Overwrites netrw's new file function
" by creating the file and redrawing the
" directory tree to show the file name
" in the list, rather than opening the
" file.
fun! ShowNewFileInDirList()
  let l:filename = input("please enter filename: ")
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename
  redraw!
endf
