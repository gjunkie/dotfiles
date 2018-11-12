fun! CheatVim()
  " Add handy bindings you tend to forget or want to learn.
  echo "________________[ Vim ]________________"
  echo "RR           Replace a word"
  echo "RW           Replace word at cursor"
  echo "<C-h>        Rotate Windows Up"
  echo "<C-l>        Move Current Window Down"
  echo "<leader>\\    Browse to github file"
  echo "<leader>d    Git diff"
  echo "<Option-c>   Git commits"
endf

fun! CheatTmux()
  " Add handy bindings you tend to forget or want to learn.
  echo "________________[ tmux ]________________"
  echo "&            Close window"
endf

noremap HV :call CheatVim() <CR>
noremap HT :call CheatTmux() <CR>
