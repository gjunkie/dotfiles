source ${HOME}/.bash/aliases.sh
source ${HOME}/.bash/fzf.sh
source ${HOME}/.bash/paths.sh
source ${HOME}/.bash/prompt/prompt.sh
export N_PREFIX=/opt/homebrew/bin/node

if [ -f ~/.local.bash ]; then
  source ~/.local.bash
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
