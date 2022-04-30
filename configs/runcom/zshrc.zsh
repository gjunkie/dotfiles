fpath=(~/.zsh $fpath)

setopt prompt_subst
autoload -U colors && colors # Enable colors in prompt

# Echoes a username/host string when connected over SSH (empty otherwise)
ssh_info() {
  [[ "$SSH_CONNECTION" != '' ]] && echo '%(!.%{$fg[red]%}.%{$fg[yellow]%})%n%{$reset_color%}@%{$fg[green]%}%m%{$reset_color%}:' || echo ''
}

# contains(string, substring)
#
# Returns 0 if the specified string contains the specified substring,
# otherwise returns 1.
contains() {
    string="$1"
    substring="$2"
    if test "${string#*$substring}" != "$string"
    then
        return 0    # $substring is in $string
    else
        return 1    # $substring is not in $string
    fi
}


# Echoes information about Git repository status when inside a Git repository
git_info() {

  # Exit if not inside a Git repository
  ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

  # Git branch/tag, or name-rev if on detached head
  local GIT_LOCATION=${$(git symbolic-ref -q HEAD || git name-rev --name-only --no-undefined --always HEAD)#(refs/heads/|tags/)}

  local AHEAD="%{$fg[red]%}⇡NUM%{$reset_color%}"
  local BEHIND="%{$fg[red]%}⇣NUM%{$reset_color%}"
  local MERGING="%{$fg[magenta]%}⚡︎%{$reset_color%}"
  local UNTRACKED="%{$fg[cyan]%}●%{$reset_color%}"
  local MODIFIED="%{$fg[green]%}●%{$reset_color%}"
  local STAGED="%{$fg[yellow]%}●%{$reset_color%}"

  # local -a DIVERGENCES
  local -a FLAGS

  local __git_status=$(git status 2> /dev/null)

  # local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
  # if [ "$NUM_AHEAD" -gt 0 ]; then
  #   DIVERGENCES+=( "${AHEAD//NUM/$NUM_AHEAD}" )
  # fi

  # local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
  # if [ "$NUM_BEHIND" -gt 0 ]; then
  #   DIVERGENCES+=( "${BEHIND//NUM/$NUM_BEHIND}" )
  # fi

  # local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
  # if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
  #   FLAGS+=( "$MERGING" )
  # fi

#   if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
#     FLAGS+=( "$UNTRACKED" )
#   fi
# 
#   if ! git diff --quiet 2> /dev/null; then
#     FLAGS+=( "$MODIFIED" )
#   fi
# 
#   if ! git diff --cached --quiet 2> /dev/null; then
#     FLAGS+=( "$STAGED" )
#   fi

  if contains "${__git_status}" "Changes not staged"; then # if repository is dirty
    FLAGS+=( "$MODIFIED" )
  fi

  if contains "${__git_status}" "Untracked files"; then # if there are only untracked files
    FLAGS+=( "$UNTRACKED" )
  fi

  if contains "${__git_status}" "Changes to be committed"; then # if there are staged files
    FLAGS+=( "$STAGED" )
  fi

  local -a GIT_INFO
  [ -n "$GIT_STATUS" ] && GIT_INFO+=( "$GIT_STATUS" )
  [[ ${#DIVERGENCES[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)DIVERGENCES}" )
  [[ ${#FLAGS[@]} -ne 0 ]] && GIT_INFO+=( "${(j::)FLAGS}" )
  GIT_INFO+=( "$GIT_LOCATION%{$reset_color%}" )
  echo "${(j: :)GIT_INFO}"

}

PS1='
┌─╼$(ssh_info)%{$fg[cyan]%}[%~%u]%{$reset_color%} $(git_info)
└─╼%(?.%{$fg[gray]%}.%{$fg[red]%})%(!.#.→)%{$reset_color%} '
