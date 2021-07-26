source ${HOME}/.bash/prompt/git_helpers.sh
source /usr/local/etc/bash_completion.d/git-prompt.sh

# store colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[00;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
CYAN="\[\033[0;36m\]"
GREEN="\[\033[00;32m\]"
RED="\[\033[0;31m\]"
ORANGE="$(tput setaf 179)"
VIOLET='\[\033[01;35m\]'

function color_my_prompt {
  local __user_and_host="$RED\u @ \h"
  local __user="$RED\u @"
  if [ $VIM ]; then
    __user_and_host="${RED}bash @ $GREEN\h"
    __user="${RED}bash @"
  fi

  local __cur_location="$BLUE\w "
  local __git_branch_color="$GREEN"
  local __user_input_color="$LIGHT_GRAY"
  local __git_status=$(git status 2> /dev/null)
  local __git_branch=$(__git_ps1) 
  local __prompt_tail="$GREEN\n └─ \$ ▶"

  # Branch dirty status represented by symbols. See: git_helpers
  local __dirty_symbols=$(parse_git_dirty "$__git_status")
  if [ "${__dirty_symbols}" != "" ]; then
    __git_branch="$(__git_ps1) [${__dirty_symbols}]"
  fi
  
  # Branch color based on git status
  if [[ "${__git_status}" =~ "Changes not staged" ]]; then          # if repository is dirty
      __git_branch_color="$GREEN"
  elif [[ "${__git_status}" =~ "Untracked files" ]]; then           # if there are only untracked files
      __git_branch_color="$CYAN"
  elif [[ "${__git_status}" =~ "Changes to be committed" ]]; then   # if there are staged files
      __git_branch_color="$ORANGE"
  else
      __git_branch_color="$LIGHT_GRAY"
  fi
   
  # Build the PS1 (Prompt String)
  PS1="$__user $__cur_location$__git_branch_color$__git_branch $__prompt_tail$__user_input_color "
}

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt
# GIT_PS1_SHOWDIRTYSTATE=true
# GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUNTRACKEDFILES=true
# GIT_PS1_SHOWUPSTREAM="auto"
# GIT_PS1_HIDE_IF_PWD_IGNORED=true
# GIT_PS1_SHOWCOLORHINTS=true
