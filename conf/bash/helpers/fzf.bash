# export FZF_DEFAULT_OPTS="--preview 'cat {}'"
# export FZF_DEFAULT_OPTS='
#   --color fg:124,bg:16,hl:202,fg+:214,bg+:52,hl+:231
#   --color info:52,prompt:196,spinner:208,pointer:196,marker:208
# '


### PROCESS
# mnemonic: [K]ill [P]rocess
# show output of "ps -ef", use [tab] to select one or multiple entries
# press [enter] to kill selected processes and go back to the process list.
# or press [escape] to go back to the process list. Press [escape] twice to exit completely.

# local pid=$(ps -ef | sed 1d | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[kill:process]'" | awk '{print $2}')
#
# if [ "x$pid" != "x" ]
# then
#   echo $pid | xargs kill -${1:-9}
#   kp
# fi
