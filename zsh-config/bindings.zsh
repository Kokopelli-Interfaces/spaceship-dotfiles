run_ranger () {
    echo
    ranger --choosedir=$HOME/.rangerdir < $TTY
    LASTDIR=`cat $HOME/.rangerdir`
    cd "$LASTDIR"
    zle reset-prompt
}
zle -N run_ranger

bindkey "\e[3~" delete-char
bindkey '^[[Z' reverse-menu-complete

run_scan() {
    sk --ansi -i -c 'rg --always-color ." {}"'
}
zle -N run_scan
