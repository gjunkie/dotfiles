export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export TERM=xterm-256color

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

_gen_fzf_default_opts() {
  local base00="241"
  local base01="240"
  local base02="235"
  local base03="234"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local gray="238"
  local yellow="226"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="195"
  local green="64"

  # Comment and uncomment below for the light theme.

  # Solarized Dark color scheme for fzf
  # export FZF_DEFAULT_OPTS="
  #   --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
  #   --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  # "
  ## Solarized Light color scheme for fzf
  #export FZF_DEFAULT_OPTS="
  #  --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
  #  --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  #"
  ## Tron Grid color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:$gray,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  "
}
_gen_fzf_default_opts

### PROCESS
# mnemonic: [K]ill [P]rocess
# show output of "ps -ef", use [tab] to select one or multiple entries
# press [enter] to kill selected processes and go back to the process list.
# or press [escape] to go back to the process list. Press [escape] twice to exit completely.
pkill() {
  local pid
  if [ "$UID" != "0" ]; then
    pid=$(ps -f -u $UID | sed 1d | fzf -m | awk '{print $2}')
  else
    pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')
  fi

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

# fstash - easier way to deal with stashes
# type fstash to get a list of your stashes
# enter shows you the contents of the stash
# ctrl-d shows a diff of the stash against your current HEAD
# ctrl-b checks the stash out as a branch, for easier merging
fstash() {
  local out q k sha
  while out=$(
    git stash list --pretty="%C(yellow)%h %>(14)%Cgreen%cr %C(blue)%gs" |
    fzf --ansi --no-sort --query="$q" --print-query \
				--header "[Enter] show contents, [Ctrl-d] show diff, [Ctrl-b] checkout as branch" \
        --expect=ctrl-d,ctrl-b);
  do
    mapfile -t out <<< "$out"
    q="${out[0]}"
    k="${out[1]}"
    sha="${out[-1]}"
    sha="${sha%% *}"
    [[ -z "$sha" ]] && continue
    if [[ "$k" == 'ctrl-d' ]]; then
      git diff $sha
    elif [[ "$k" == 'ctrl-b' ]]; then
      git stash branch "stash-$sha" $sha
      break;
    else
      git stash show -p $sha
    fi
  done
}

# Lists local branches, checks out selected branch
branches() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

# Lists local branches not merged into local master
unmerged() {
  git branch --merged master | grep -v 'master$'
}

# Prunes local branches not merged into local master
prune() {
  git branch --merged master | grep -v 'master$' | xargs git branch -d
}

cd() {
  if [[ "$#" != 0 ]]; then
    builtin cd "$@";
    return
  fi
  while true; do
    local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
    local dir="$(printf '%s\n' "${lsd[@]}" |
      fzf --reverse --preview '
        __cd_nxt="$(echo {})";
        __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
        echo $__cd_path;
        echo;
        ls -p -lG "${__cd_path}";
    ')"
    [[ ${#dir} != 0 ]] || return 0
    builtin cd "$dir" &> /dev/null
  done
}

# browser - browse chrome history
browser() {
  local cols sep google_history open
  cols=$(( COLUMNS / 3 ))
  sep='{::}'

  if [ "$(uname)" = "Darwin" ]; then
    google_history="$HOME/Library/Application Support/Google/Chrome/Default/History"
    open=open
  else
    google_history="$HOME/.config/google-chrome/Default/History"
    open=xdg-open
  fi
  cp -f "$google_history" /tmp/h
  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\x1b[m\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs $open > /dev/null 2> /dev/null
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

# compare current branch to master, pipe results to fzf
compare() {
	# Check if it's a git repo
	[[ $(git root 2>&1) == 'Not a git repo!' ]] && echo "Not a git repo!" && exit 1

	# Assign master to $branch if not defined yet
	local branch
	[[ -z "$1" ]] && branch='master' || branch=$1

	function git-stack() {
		glNoGraph() {
			git log "$branch".. --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"
		}

		_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
		_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always %'"

		glNoGraph |
			fzf --cycle --no-sort --reverse --tiebreak=index --no-multi \
				--ansi --preview="$_viewGitLogLine" \
				--header "enter to view, alt-y to copy hash" \
				--bind "enter:execute:$_viewGitLogLine   | less -R" \
				--bind "alt-y:execute:$_gitLogLineToHash | xclip"
	}

	git-stack
}
