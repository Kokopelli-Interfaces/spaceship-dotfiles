export SKIM_DEFAULT_COMMAND="fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ."

export SKIM_CTRL_R_COMMAND='--bind alt-j:down,alt-k:up'
export SKIM_CTRL_T_COMMAND='ag --ignore-dir program --ignore-dir node_modules --ignore .git -g ""'

export SKIM_CTRL_T_OPTS="--height 70% --preview '(highlight -O ansi -l {} || coderay {} || rougify {} || cat {}) 2> /dev/null | head -500'"
export SKIM_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export SKIM_DEFAULT_OPTS='--reverse --bind alt-j:down,alt-k:up,alt-u:preview-up,alt-f:preview-page-down,alt-b:preview-page-up'
