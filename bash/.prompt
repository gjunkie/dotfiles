parse_git_branch ()
{
  if git rev-parse --git-dir >/dev/null 2>&1
    then
      gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  else
    return 0
  fi
  echo -e "[$gitver]"
}

# Adds color coding to the branches
branch_color ()
{
  git_status="$(git status 2> /dev/null)"
    # Set color based on clean/staged/dirty.
    if [[ ${git_status} =~ "nothing to commit, working tree clean" ]]; then
      color="${LIGHT_GREEN}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
      color="${YELLOW}"
    else
      color="${LIGHT_RED}"
    fi
    echo -ne $color
}

# Prompt
PS1='\[\e[34m\][\w] \[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\n→ '
