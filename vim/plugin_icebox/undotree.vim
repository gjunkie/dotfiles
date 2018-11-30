let vimDir = '$HOME/.vim'

if has('persistent_undo')
  let myUndoDir = expand(vimDir . '/undodir')
  " Create directories
  call system('mkdir ' . vimDir)
  call system('mkdir ' . myUndoDir)
  let &undodir = myUndoDir
  set undofile
endif
