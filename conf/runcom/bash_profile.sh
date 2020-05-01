source /usr/local/opt/dotfiles/conf/bash/aliases.sh
source /usr/local/opt/dotfiles/conf/bash/colors.sh
source /usr/local/opt/dotfiles/conf/bash/fzf.sh
source /usr/local/opt/dotfiles/conf/bash/git_completions.sh
source /usr/local/opt/dotfiles/conf/bash/paths.sh
source /usr/local/opt/dotfiles/conf/bash/prompt.sh

if [ -f ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
