source ${HOME}/.bash/prompt/git_helpers.sh
source ${HOME}/.bash/prompt/prompt_colors.sh

# Prompt
PS1='[\e${PRIMARY_FG}\u\e${NC}\e${LIGHT_GRAY_FG}:\e${NC}\e${SECONDARY_FG}\h\e${NC}] in \e${TERTIARY_FG}\w\e${NC}\[${c_sgr0}\] $(print_if_in_repo 'on') \[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]\n\$ '

