source ${HOME}/.bash/prompt/git_helpers.sh
source ${HOME}/.bash/prompt/prompt_colors.sh

# Prompt
PS1='[\e${PRIMARY_FG}\u\e${COLOR_NONE}\e${LIGHT_GRAY_FG}:\e${COLOR_NONE}\e${SECONDARY_FG}\h\e${COLOR_NONE}] in \e${TERTIARY_FG}\w\e${COLOR_NONE}\[${c_sgr0}\] $(print_if_in_repo 'on') \[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\n\$ '

