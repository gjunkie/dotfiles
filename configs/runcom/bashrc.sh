source ${HOME}/.bash/aliases.sh
source ${HOME}/.bash/fzf.sh
source ${HOME}/.bash/paths.sh
source ${HOME}/.bash/prompt/prompt.sh

if [ -f ~/.local.bash ]; then
  source ~/.local.bash
fi
