# Adds color coding to the branches
function branch_color ()
{
  git_status="$(git status 2> /dev/null)"
    # Set color based on clean/staged/dirty.
    if [[ ${git_status} =~ "nothing to commit, working tree clean" ]]; then
      color="${GIT_CLEAN}"
    elif [[ ${git_status} =~ "Changes to be committed" ]]; then
      color="${GIT_STAGED}"
    else
      color="${GIT_DIRTY}"
    fi
    echo -ne $color
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		STATUS=`parse_git_dirty`
		if [ "${STATUS}" == "" ]
		then
			echo "${BRANCH}"
		else
			echo "${BRANCH} [${STATUS}]"
		fi
	else
		echo ""
	fi
}

# get current branch in git repo
function print_if_in_repo() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
		echo "$1"
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty {
	dirty=`echo -n "$1" 2> /dev/null | grep "Changes not staged for commit" &> /dev/null; echo "$?"`
	untracked=`echo -n "$1" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	staged=`echo -n "$1" 2> /dev/null | grep "Changes to be committed" &> /dev/null; echo "$?"`
	ahead=`echo -n "$1" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	behind=`echo -n "$1" 2> /dev/null | grep "commits behind" &> /dev/null; echo "$?"`
	newfile=`echo -n "$1" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "$1" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "$1" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`

	bits=''
	if [ "${renamed}" == "0" ]; then
		bits=">${bits}"
	fi
	if [ "${ahead}" == "0" ]; then
		bits="⇡${bits}"
	fi
	if [ "${behind}" == "0" ]; then
		bits="⇣${bits}"
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
	if [ "${staged}" == "0" ]; then
		bits="↯${bits}"
	fi
	if [ ! "${bits}" == "" ]; then
		echo "${bits}"
	else
		echo ""
	fi
}
