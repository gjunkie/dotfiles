alias ls='ls -la'
alias play='cd ~/Projects/'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# FZF Aliases
alias gitl="git log --pretty=oneline --abbrev-commit --no-merges | fzf --preview 'echo {} | cut -f 1 -d \" \" | xargs git show --color=always'"
