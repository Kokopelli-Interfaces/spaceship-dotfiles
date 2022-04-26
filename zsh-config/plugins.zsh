zstyle ':znap:*' repos-dir $ZSH_HOME/zsh-plugins
source $ZSH_HOME/zsh-snap/znap.zsh
source /etc/profile.d/locale.sh

# `znap source` automatically downloads and starts your plugins.
znap source zsh-users/zsh-autosuggestions
znap source zsh-users/zsh-syntax-highlighting
znap source subnixr/minimal
znap source softmoth/zsh-vim-mode
znap source hackerchai/skim-zsh

# `znap function` lets you lazy-load features you don't always need.
znap function _pyenv pyenvn 'eval "$( pyenv init - --no-rehash )"'
compctl -K    _pyenv pyenn
