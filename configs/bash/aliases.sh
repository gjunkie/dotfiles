alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias play='cd ~/Projects/'

alias vim="nvim"
alias vi="nvim"

alias ctags="`brew --prefix`/bin/ctags"

alias lsl='ls -lF -G'
alias lsa='ls -la -G'

# Put machine to sleep
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# FZF Aliases
alias gitl="git log --pretty=oneline --abbrev-commit --no-merges | fzf --preview 'echo {} | cut -f 1 -d \" \" | xargs git show --color=always'"
