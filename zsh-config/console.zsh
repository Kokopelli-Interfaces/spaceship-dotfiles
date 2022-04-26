# Command Line Aliases (doubles as essential command guide)

## Essentials
alias c='clear'            # Clear terminal (or press <Enter>)
bindkey '^M' run_clear     # <Enter>

alias pwd='pwd'            # Print name of working directory
alias cd='cd'              # Change the working directory (press <Alt+c> for an interactive method)
bindkey '^[c' run_cd       # <Alt+c>

alias view='bat'           # View the content of one or multiple file(s)

alias ls='exa --icons'     # List files in current directory in row
alias list='ls -la'        # List files in current directory in list - showing all information

alias _='sudo'             # Run command as admin (e.g. sudo ls /root)

alias find='fd'            # Find files
bindkey '^T' run_find      # <Ctrl+t> - Interactively find files (e.g. view <Ctrl+t>)

alias scan='rg'            # Search through file data (e.g. view README.md | scan 'http')
bindkey '^[s' run_scan     # <Alt+s> Scan text from working directory

### Tip: use <Ctrl+r> to search history of commands executed
bindkey '^R' run_search_history


## File Navigation
### use h,j,k,l to navigate - press '?' for help
### (and try out the custom bindings <C-f>, <A-c>, <C-e>, <C-g>)
alias ranger='ranger'      # Open Ranger
bindkey '^f' run_ranger    # <Ctrl+f> Open Ranger


## Package Management
### Try typing 'p -' in terminal and pressing <Tab> for completions
alias p='sudo pacman'      # Core system package managment utility
alias pi='p -S'            # Install package for system
alias pr='p -R'            # Remove Package
alias pq='p -Q'            # Get Package information
alias yay='yay'            # User package management utility
alias yi='yay -S'          # Same as pacman -S, only yay also has access to packages in the Arch Linux User Repository (AUR). I always use yay.


## Guides
### (also try adding '-h' to the end of a command to display help)
alias man='man'            # Open manual for command
alias tldr='tldr'          # Open condensed manual for command
alias manly='manly'        # Describe what a command and it's flags do
alias navi='navi'          # Navigate a list of commands
bindkey '^[h' _navi_widget # <Alt+h> Open navi widget


## Powerful Programs
alias e='spacemacs'        # Launch Spacemacs - a powerful text editting environment
alias edit='spacemacs'
alias boot-spacemacs='killall emacs && emacs --daemon &'
alias jl='julia'           # Launch an interactive Julia Console - a scientific mathematics environment
alias calculate='julia'

## Tmux
#### A terminal-multiplexer for running command line processes in parallel. Use the following alias to create or rejoin the "Home" session. Try typing "<Ctrl+s>/" to split the terminal vertically. Type "<Ctrl+s>?" for a guide.
alias tm='tmux attach -t \
"Home" || tmux new-session\
 -c ~ -s "Home"'


## Command Utilities
alias skim='sk'            # Interactively skim through text (e.g. `view file.txt | skim`)
alias replace='sad'        # Replace text (e.g type "'echo <Ctrl+t>README<down><Backtab><Enter> | replace 'pattern' 'replace'")
alias pattern='grex'       # Generate a regex pattern
alias diff='delta'         # Show difference across files
alias clock='hyperfine'    # Time a command
alias summarize='tokei'    # Print summary of directory content


## System Information
alias system='btop'       # Launch System Overview Console
alias disk='dust'          # Show Disk Usage
alias filesystem='rdf'     # Show Filesystem
alias procs='procs'        # Show Processes
alias services='chkservice'# Show background service processes
alias devices='lsblk'      # Show Devices
alias klog='sudo rmesg'    # Print kernel log


## Programming

### Golang
alias gb='go build'
alias ,='go run'

### Python
alias py='/usr/bin/python3.8'

### Git
alias gs='git status'
alias gc='git commit'
alias ga='git add'
alias gp='git push'


## Misc
alias ..='cd ..'           # Change directory to parent directory ('.' -> current dir)
alias ...='cd ../../'      #
alias dig='dog'            # Command line DNS (Domain Name Server) client
alias cat='bat'            # Print and concatenate files
