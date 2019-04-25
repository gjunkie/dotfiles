source ~/.bash/aliases.sh
source ~/.bash/colors.sh
source ~/.bash/fzf.sh
source ~/.bash/git_completion.sh
source ~/.bash/paths.sh
source ~/.bash/prompt.sh

if [ -f ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
