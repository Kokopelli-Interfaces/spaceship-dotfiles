export ZSH_HOME="$HOME/Dotfiles"

source $ZSH_HOME/zsh-config/skim.zsh
source $ZSH_HOME/zsh-config/plugins.zsh
source $ZSH_HOME/zsh-config/widgets.zsh
source $ZSH_HOME/zsh-config/paths.zsh
source $ZSH_HOME/zsh-config/environment.zsh

clear

eval "$(navi widget zsh)"
bindkey -r '^g'
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

source $ZSH_HOME/zsh-config/console.zsh

autoload -U compinit && compinit
