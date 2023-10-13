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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
