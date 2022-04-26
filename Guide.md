## Zsh - Spaceship Console

- The `zsh-config/console.zsh` contains a list of commands and bindings to get you started in the spaceship console.

## Spacemacs - Spaceship Editor

- The default text-editor of spaceship is a configuration of [spacemacs](https://www.spacemacs.org/). It is a vim-text editor, so that means there is a normal mode and an insert mode. In normal mode, the keys execute various commands for navigation and text editting. You can enter `ZZ` to save and quit, or `<C-q>` to quit all, for example.

- You can always change the default editor to something more simple (e.g. `kate`) by setting the editor in `zsh-config/environment`

- All of spaceship is centred around vim-bindings. From firefox, to the file-explorer, to the media player. 

- You can become familiar with vim by playing a zelda-like game [here](https://vim-adventures.com/).

- If `spacemacs` looks weird at first, enter `<SPC>feR` to reload the config. You can type `edit` in the console to open spacemacs, or select a file with ranger. It works by connecting with a background emacs service, if you need to reboot the service, you can type `boot-spacemacs` in the terminal.B

- Most commands of `spacemacs` are accessed through pressing the leader key - `<SPC>` (try out `<SPC>h<SPC>` for starts, or `<SPC>hdm` for describing all the modes currently running (and thus what the keys do), and `<SPC>hdk` for understanding what a key does).

- `spacemacs` has been configured to integrate with the spaceship console. The wokflow is to navigate the filesystem with a spaceship console running `tmux` (enter `tm`) and `ranger` (enter `<Ctrl+f>`), edit a file with `spacemacs` by selecting it in ranger (`l`), close (`ZZ`), and repeat.

### Updating

The Dotfiles of spaceeship are in a git-repository - so you can update them as they are changed. You could also create your own branch if you like to keep revisions of your spaceship configuration. If you have opened this file with spacemacs, enter `<SPC>gs` to show a status report. Most functions in magit (enter `?`) are rarely used - the essentials are fetching, pulling, staging, and comitting.
