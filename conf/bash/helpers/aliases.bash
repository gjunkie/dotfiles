alias ls='ls -la'
alias play='cd ~/Projects/'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias log="git log --pretty=oneline --abbrev-commit | fzf --preview 'echo {} | cut -f 1 -d \" \" | xargs git show --color=always'"
