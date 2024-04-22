source ${HOME}/.bash/prompt/git_helpers.sh
source ${HOME}/.bash/git-completion.bash
source ${HOME}/.bash/git-prompt.bash

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
# Explicitly unset color (default anyhow). Use 1 to set it.
export GIT_PS1_SHOWCOLORHINTS=1
export GIT_PS1_DESCRIBE_STYLE="branch"
# export GIT_PS1_SHOWUPSTREAM="auto git"

# if [[ -f "$XDG_CONFIG_HOME/bash/gitprompt.sh" ]]; then
# 	source "$XDG_CONFIG_HOME/bash/gitprompt.sh"
# fi

# PROMPT_COMMAND='__git_ps1 "\u@\h:\W" " \n$ "'
# colorized prompt
PROMPT_COMMAND='__git_ps1 "\[\e[33m\]\u\[\e[0m\]@\[\e[34m\]\h\[\e[0m\]:\[\e[35m\]\W\[\e[0m\]" " \n$ "'

# The __git_ps1 function prompt is provided by the bash completion installed by brew. See https://github.com/mischavandenburg/dotfiles/issues/5
