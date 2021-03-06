# Spaceship Overview

## Initial Setup instructions

1. Set the background
  a) Press `<Meta-u>` and `<Meta-i>` to move between desktops (Open 'shortcuts' with the `<Meta-d>` and look under 'kwin' for a list of window management bindings)
  b) On an empty desktop, right click the background and set the wallpaper to the picture in ``~/Library/Images`
  c) Set the wallpaper for the login-screen as well by entering launching 'sddm' with the `<Meta-d>` `launcher

2. Create a spaceship deck
  a) Open the application launcher `<Meta-d>` and launch `kitty` - a spaceship console will then appear
  b) Type `deck` and enter to create the deck of the spaceship  - an environment for spaceship processes
  c) Refresh the deck by pressing the deck meta key `<Ctrl-s>` and then `R`
  d) Create two processes by pressing the deck meta key `<Ctrl-s>` and pressing `/`
  e) Move between thehm by using `<C-h>` and `<C-l>``
  f) Rename your deck window to 'Tutorial' by entering `<C-s>,` (enter `<C-s>?` for a list of deck meta commands)

3. Learn the basics of the spaceship console
  a) In one of the consoles, enter `view ~/Dotfiles/zsh-plugins/console.zsh`
  b) Interact with the view with the keys "j,k,<Ctrl-u>,<Ctrl-d>,/" (press h for help)
  c) Switch back to the other console and run the commands

4. Create a space firefox
  a) Use ranger or commands to move the `~/Dotfiles/firefox/chrome` folder into the `~/.mozilla/firefox/<your user profile>` folder
  b) Install the [surfingkeys](https://addons.mozilla.org/en-US/firefox/addon/surfingkeys_ff/) firefox add-ono for vim-bindings in firefox (recommended) - then copy-paste `~/Dotfiles/firefox/surfingkeys.js` into the 'advanced-mode' settings box in the add-on settings. Then, when you press `o` it should launch a dark omni-bar (press `?` for a guide)
  c) Another add-on I like are [Dark Reader](https://addons.mozilla.org/en-US/firefox/addon/darkreader/) 
  d) Set the search-engine to something friendly - like ecosia or duckduckgo

5. Explore. (Consult the documentation and numerous help resources online for information about parts of spaceship - e.g. Manjaro Wiki, AUR, Spacemacs Wiki, Ranger wiki, Vim wiki...)

# Guide

## The Spaceship Deck - tmux

- The deck contains multiple windows (or 'workspaces') which may contain multiple spaceship consoles which run spaceship processes

- Use the leader key `<Ctrl-s>` to enter deck commands (e.g see `<Ctrl-?>`)

## The Spaceship Console - zsh

- The spaceship console is used to run spaceship processes

- The `zsh-config/console.zsh` contains a list of commands and bindings to get you started in the spaceship console.

## The Spaceship Editor - spacemacs

- The default text-editor of spaceship is a configuration of [spacemacs](https://www.spacemacs.org/). It is a vim-text editor, so that means there is a normal mode and an insert mode. In normal mode, the keys execute various commands for navigation and text editting. You can enter `ZZ` to save and quit, or `<C-q>` to quit all, for example.

- You can always change the default editor to something more simple (e.g. `kate`) by setting the editor in `zsh-config/environment`

- All of spaceship is centred around vim-bindings. From firefox, to the file-explorer, to the media player. 

- You can become familiar with vim by playing a zelda-like game [here](https://vim-adventures.com/).

- If `spacemacs` looks weird at first, enter `<SPC>feR` to reload the config. You can type `edit` in the console to open spacemacs, or select a file with ranger. It works by connecting with a background emacs service, if you need to reboot the service, you can type `boot-spacemacs` in the terminal.B

- Most commands of `spacemacs` are accessed through pressing the leader key - `<SPC>` (try out `<SPC>h<SPC>` for starts, or `<SPC>hdm` for describing all the modes currently running (and thus what the keys do), and `<SPC>hdk` for understanding what a key does).

- `spacemacs` has been configured to integrate with the spaceship console. The wokflow is to navigate the filesystem with a spaceship console running `tmux` (enter `tm`) and `ranger` (enter `<Ctrl-f>`), edit a file with `spacemacs` by selecting it in ranger (`l`), close (`ZZ`), and repeat.

---

## Updating the Configuration

The Dotfiles of spaceeship are in a git-repository - so you can update them as they are changed. You could also create your own branch if you like to keep revisions of your spaceship configuration. If you have opened this file with spacemacs, enter `<SPC>gs` to show a status report. Most functions in magit (enter `?`) are rarely used - the essentials are fetching, pulling, staging, and comitting.
