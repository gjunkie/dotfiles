source ${HOME}/.bash/aliases.sh
source ${HOME}/.bash/fzf.sh
source ${HOME}/.bash/paths.sh
source ${HOME}/.bash/prompt/prompt.sh

if [ -f ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi

export EDITOR=vim
export PATH=/Users/${USER}/.gem/ruby/2.6.0/bin:$PATH
