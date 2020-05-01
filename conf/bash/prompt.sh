parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
    then
      gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
    return 0
  fi
  echo -e "(on branch $gitver)"
}

# Adds color coding to the branches
branch_color ()
{
  git_status="$(git status 2> /dev/null)"
    # Set color based on clean/staged/dirty.
    if [[ ${git_status} =~ "nothing to commit, working tree clean" ]]; then
      color="${GREEN}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
      color="${YELLOW}"
    else
      color="${RED}"
    fi
    echo -ne $color
}

# get current branch in git repo
# function parse_git_branch() {
# 	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
# 	if [ ! "${BRANCH}" == "" ]
# 	then
# 		STAT=`parse_git_dirty`
# 		echo "[${BRANCH}${STAT}]"
# 	else
# 		echo ""
# 	fi
# }

# get current status of git repo
function parse_git_dirty {
	gstatus=`git status 2>&1 | tee`
	dirty=`echo -n "${gstatus}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${gstatus}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${gstatus}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${gstatus}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${gstatus}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${gstatus}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="*${bits}"
	fi
	if [ "${newfile}" == "0" ]; then
		bits="+${bits}"
	fi
	if [ "${untracked}" == "0" ]; then
		bits="?${bits}"
	fi
	if [ "${deleted}" == "0" ]; then
		bits="x${bits}"
	fi
	if [ "${dirty}" == "0" ]; then
		bits="!${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo " ${bits}"
	else
		echo ""
	fi
}

# export PS1="\W \`parse_git_branch\`: "
# Prompt
# PS1=$'[%~] \[$(branch_color)\]$(parse_git_branch)'
PS1='\u: \w \[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\n→ '
# PS1=$'[%~] \[$(branch_color)\]\$(vcs_info_msg_0_)\n→ '

# Echoes a username/host string when connected over SSH (empty otherwise)
ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:' || echo ''
}

# Echoes information about Git repository status when inside a Git repository
git_info() {

  # Exit if not inside a Git repository
  ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

  local AHEAD="${RED}⇡NUM%{$reset_color%a"
  local BEHIND="${CYAN}⇣NUM%{$reset_color%}"
  local MERGING="${MAGENTA}⚡︎%{$reset_color%}"
  local UNTRACKED="${RED}●%{$reset_color%}"
  local MODIFIED="${LIGHT_GREEN}●%{$reset_color%}"
  local STAGED="${YELLOW}●%{$reset_color%}"
[${c_sgr0}\]
  local -a DIVERGENCES
  local -a FLAGS

  local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_AHEAD" -gt 0 ]; then
    DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
  fi

  local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  if [ "$NUM_BEHIND" -gt 0 ]; then
    DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
  fi

  local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
    FLAGS+=( "$MERGING" )
  fi

  if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
    FLAGS+=( "$UNTRACKED" )
  fi

  if ! git diff --quiet 2> /dev/null; then
    FLAGS+=( "$MODIFIED" )
  fi

  if ! git diff --cached --quiet 2> /dev/null; then
    FLAGS+=( "$STAGED" )
  fi

  local -a GIT_INFO
  GIT_INFO+=( "\033[38;5;15m±" )
  [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
  [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
  [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
  GIT_INFO+=( "\033[38;5;15m$GIT_LOCATION%{$reset_color%}" )
  echo "${(j: :)GIT_INFO}"

}

# PS1="
# $(ssh_info)[\u] [\W] $(git_info) %(?.%{$fg[gray]%}.%{$fg[red]%})%(!.#.→)%{$reset_color%} "
