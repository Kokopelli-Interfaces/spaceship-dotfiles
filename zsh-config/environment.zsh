export EDITOR='spacemacs'
export VISUAL='spacemacs'
export ALTERNATE_EDITOR='vim'
export MNML_USER_CHAR=' ϻ'
export GIT_PAGER='delta'

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY SHARE_HISTORY
setopt HIST_BEEP

export SAVEHIST=5000
export HISTSIZE=5000
export HISTFILE=$HOME/.zsh_history

ZSH_CACHE_DIR=$HOME/.cache/zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
    mkdir $ZSH_CACHE_DIR
fi
