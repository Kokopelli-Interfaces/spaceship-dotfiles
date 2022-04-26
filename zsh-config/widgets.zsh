run_clear () {
    if [ ${#${(z)BUFFER}} -eq 0 ]; then
        clear
    fi
    zle accept-line
}
zle -N run_clear

run_ranger () {
    echo
    ranger --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=`cat $HOME/.rangerdir`
    cd "$LASTDIR"
    zle reset-prompt
}
zle -N run_ranger
