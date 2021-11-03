source ${HOME}/.bash/prompt/git_helpers.sh
source /usr/local/etc/bash_completion.d/git-prompt.sh

# store colors
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
# BLUE='\e[0;34m'
BLUE="\[\033[00;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
DARK_GRAY="\e[01;30m"
CYAN="\[\033[0;36m\]"
# GREEN="\e[0;36m"
GREEN="\[\033[00;32m\]"
RED="\[\033[0;31m\]"
ORANGE="$(tput setaf 179)"
VIOLET='\[\033[01;35m\]'
WHITE='\[\e[0m\]'

function color_my_prompt {
  local __user_and_host="$DARK_GRAY[$BLUE\u @ \h$DARK_GRAY]"
  local __user="$DARK_GRAY[$BLUE\D{%H:%M:%S}$DARK_GRAY]"
  if [ $VIM ]; then
    __user_and_host="${BLUE}bash @ $GREEN\h"
    __user="${BLUE}bash @"
  fi

  local __cur_location="$CYAN\w "
  local __git_branch_color="$CYAN"
  local __user_input_color="$LIGHT_GRAY"
  local __git_status=$(git status 2> /dev/null)
  local __git_branch=$(__git_ps1)

  # Branch dirty status represented by symbols. See: git_helpers
  local __dirty_symbols=$(parse_git_dirty "$__git_status")
  if [ "${__dirty_symbols}" != "" ]; then
    __git_branch="$(__git_ps1) ${__dirty_symbols}"
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
   
  local __prompt_head="${DARK_GRAY}┌"
  local __prompt_tail="\n${DARK_GRAY}└ \$ »"

  # Build the PS1 (Prompt String)
  PS1="$__prompt_head $__user $__cur_location$__git_branch_color$__git_branch $WHITE$__prompt_tail$__user_input_color "
}

# configure PROMPT_COMMAND which is executed each time before PS1
export PROMPT_COMMAND=color_my_prompt

# 
# # +-----------------+
# # + Git Integration +
# # +-----------------+
# # +--- Dirty State ---+
# # Show unstaged (*) and staged (+) changes.
# # Also configurable per repository via "bash.showDirtyState".
# GIT_PS1_SHOWDIRTYSTATE=true
# 
# # +--- Stash State ---+
# # Show currently stashed ($) changes.
# GIT_PS1_SHOWSTASHSTATE=false
# 
# # +--- Untracked Files ---+
# # Show untracked (%) changes.
# # Also configurable per repository via "bash.showUntrackedFiles".
# GIT_PS1_SHOWUNTRACKEDFILES=true
# 
# # +--- Upstream Difference ---+
# # Show indicator for difference between HEAD and its upstream.
# #
# # <  Behind upstream
# # >  Ahead upstream
# # <> Diverged upstream
# # =  Equal upstream
# #
# # Control behaviour by setting to a space-separated list of values:
# #   auto     Automatically show indicators
# #   verbose  Show number of commits ahead/behind (+/-) upstream
# #   name     If verbose, then also show the upstream abbrev name
# #   legacy   Do not use the '--count' option available in recent versions of git-rev-list
# #   git      Always compare HEAD to @{upstream}
# #   svn      Always compare HEAD to your SVN upstream
# #
# # By default, __git_ps1 will compare HEAD to SVN upstream ('@{upstream}' if not available).
# # Also configurable per repository via "bash.showUpstream".
# GIT_PS1_SHOWUPSTREAM="auto verbose name"
# 
# # +--- Describe Style ---+
# # Show more information about the identity of commits checked out as a detached HEAD.
# #
# # Control behaviour by setting to one of these values:
# #   contains  Relative to newer annotated tag (v1.6.3.2~35)
# #   branch    Relative to newer tag or branch (master~4)
# #   describe  Relative to older annotated tag (v1.6.3.1-13-gdd42c2f)
# #   default   Exactly matching tag
# GIT_PS1_DESCRIBE_STYLE="contains"
# 
# # +--- Colored Hints ---+
# # Show colored hints about the current dirty state. The colors are based on the colored output of "git status -sb".
# # NOTE: Only available when using __git_ps1 for PROMPT_COMMAND!
# GIT_PS1_SHOWCOLORHINTS=true
# 
# # +--- pwd Ignore ---+
# # Disable __git_ps1 output when the current directory is set up to be ignored by git.
# # Also configurable per repository via "bash.hideIfPwdIgnored".
# # GIT_PS1_HIDE_IF_PWD_IGNORED=false
# # export LANG=en_US.UTF-8
# # export LC_MESSAGES=POSIX
# # 
# # compile_prompt () {
# #   local EXIT=$?
# #   local CONNECTBAR_DOWN=$'\u250C\u2500\u257C'
# #   local CONNECTBAR_UP=$'\u2514\u2500\u257C'
# #   local GITSPLITBAR=$'\u2570\u257C'
# #   local SPLITBAR=$'\u257E\u2500\u257C'
# #   local ARROW=$'\u25B6'
# #   local c_gray='\e[01;30m'
# #   local c_blue='\e[0;34m'
# #   local c_cyan='\e[0;36m'
# #   local c_reset='\e[0m'
# # 
# #   # > Connectbar Down
# #   # Format:
# #   #   (newline)(bright colors)(connectbar down)
# #   PS1="\n${c_gray}"
# #   PS1+="$CONNECTBAR_DOWN"
# # 
# #   # > Username
# #   # Format:
# #   #   (bracket open)(username)(bracket close)(splitbar)
# #   PS1+="[${c_blue}\u${c_gray}]"
# #   PS1+="$SPLITBAR"
# # 
# #   # > Jobs
# #   # Format:
# #   #   (bracket open)(jobs)(bracket close)(splitbar)
# #   PS1+="[${c_blue}\j${c_gray}]"
# # 
# #   # > Exit Status
# #   # Format:
# #   #   (bracket open)(last exit status)(bracket close)(splitbar)
# #   PS1+="[${c_blue}${EXIT}${c_gray}]"
# #   PS1+="$SPLITBAR"
# # 
# #   # > Time
# #   # Format:
# #   #   (bracket open)(time)(bracket close)(newline)(connectbar up)
# #   PS1+="[${c_blue}\D{%H:%M:%S}${c_gray}]\n"
# #   PS1+="$CONNECTBAR_UP"
# # 
# #   # > Working Directory
# #   # Format:
# #   #   (bracket open)(working directory)(bracket close)(newline)
# #   PS1+="[${c_blue}\w${c_gray}]\n"
# # 
# #   # > Git
# #   # Format:
# #   #   (gitsplitbar)(bracket open)(git branch)(bracket close)(splitbar)
# #   #   (bracket open)(HEAD-SHA)(bracket close)
# #   PS1+="$(__git_ps1 " \\u2570\\u257C[${c_cyan}%s${c_gray}]\\u257E\\u2500\\u257C[${c_cyan}$(git rev-parse --short HEAD 2> /dev/null)${c_gray}]")"
# #   # Append additional newline if in git repository
# #   if [[ ! -z $(__git_ps1) ]]; then
# #     PS1+='\n'
# #   fi
# # 
# #   # > Arrow
# #   # NOTE: Color must be escaped with '\[\]' to fix the text overflow bug!
# #   # Format:
# #   #   (arrow)(color reset)
# #   PS1+="$ARROW \[\e[0m\]"
# # }
# # 
# # PROMPT_COMMAND='compile_prompt'
