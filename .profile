alias sudo='doas'
alias ls='ls -h --color=auto'
alias dir='dir -h --color=auto'
alias grep='grep --color=auto'
alias wget="wget -U 'noleak'"
alias curl="curl --user-agent 'noleak'"

[[ -z $DISPLAY && $TERM != 'xterm' && $XDG_VTNR -eq 1 ]] && exec startx -- -ignoreABI
[[ -z $DISPLAY && $TERM != 'xterm' && $XDG_VTNR -ne 1 ]] && exec bash
