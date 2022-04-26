;;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(octave
     dap
     vue
     epub
     syntax-checking
    (rust
      :variables
      rust-backend 'lsp
      rust-format-on-save t)
    (lsp
      :variables
      lsp-ui-sideline-show-symbol nil
      lsp-ui-doc-enable nil
      lsp-ui t
      lsp-rust-server 'rust-analyzer
      lsp-navigation 'peek
      lsp-headerline-breadcrumb-enable nil
      lsp-headerline-breadcrumb-segments '(project file symbols)
      lsp-ui-doc-include-signature t)
     ranger
     (auto-completion
      :variables
      auto-completion-enable-sort-by-usage t
      auto-completion-enable-help-tooltip 'manual
      auto-completion-return-key-behavior 'nil
      auto-completion-tab-key-behavior 'complete
      :disabled-for org spacemacs-org)
     (ruby :variables
           ruby-enable-enh-ruby-mode t
           ruby-backend 'lsp)
     (go :variables go-backend 'lsp)
     (julia :variables julia-mode-enable-lsp t)
     javascript
     yaml
     ;; latex
     systemd
     csv
     ;; (php :variables php-backend 'lsp)
     ;; (typescript :variables typescript-fmt-on-save t)
     ;; react
     (lua :variables lua-backend 'lsp-emmy)
     (python :variables
              python-backend 'lsp
              python-lsp-server 'mspyls
              python-lsp-git-root "~/Program/python-language-server")
     ipython-notebook
     docker
     html
     vimscript
     emacs-lisp
     (c-c++ :variables c-c++-backend 'lsp-ccls)
     helm
     speed-reading
     (git :variables git-enable-magit-delta-plugin t)
     markdown
     multiple-cursors
     themes-megapack
     org
     (shell :variables
            shell-default-shell 'multi-term
            shell-default-height 30
            shell-default-position 'bottom
            shell-enable-smart-eshell t
            shell-protect-eshell-prompt t
            shell-default-term-shell "/usr/bin/zsh"
            shell-multi-term-program "/usr/bin/zsh"
            shell-default-full-span nil)
     (spell-checking :variables
                     spell-checking-enable-by-default nil)
     version-control
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ;; (rustic)
                                      (writeroom-mode :location (recipe :fetcher github :repo "joostkremers/writeroom-mode"))
                                      (writegood-mode)
                                      (go-direx)
                                      (ob-julia :location(recipe :fetcher github :repo "gjkerns/ob-julia"))
                                      (ox-extra :location(recipe :fetcher github
                                      :repo "Fuco1/org-mode"))
                                      (outline-toc)
                                      (olivetti)
                                      (eterm-256color)
                                      ;; (zoxide)
                                      (ox-hugo)
                                      (sublimity :location (recipe :fetcher github :repo "zk-phi/sublimity")) ;; Smooth scroll
                                      (0xc))

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; File path pointing to emacs 27.1 executable compiled with support
   ;; for the portable dumper (this is currently the branch pdumper).
   ;; (default "emacs-27.0.50")
   dotspacemacs-emacs-pdumper-executable-file "emacs-27.0.50"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=~/.emacs.d/.cache/dumps/spacemacs.pdmp
   ;; (default spacemacs.pdmp)
   dotspacemacs-emacs-dumper-dump-file "spacemacs.pdmp"

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7)
                                (todos . 10 ))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         kaolin-valley-dark
                         sunny-day
                         ;; solarized-wombat-dark
                         darktooth
                         kaolin-mono-dark
                         kaolin-ocean
                         kaolin-aurora
                         jbeans
                         subatomic
                         ;; solarized-gruvbox-dark
                         ;; solarized-dark-high-contrast
                         )

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.

   dotspacemacs-default-font '(("NotoSansMono Nerd Font"
                                :size 13.0
                                :powerline-scale 0.5
                                :weight normal
                                :width normal )
                               ("Source Code Pro"
                                :size  14.0
                                :weight normal
                                :width normal ))

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key "C-M-,"

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-,"

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Base"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout t

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 97

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 30

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil

   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'current

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup `nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."

  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  ;; set zoom, scale, text size here
  (setq default-frame-alist '((font . "NotoSansMono Nerd Font:pixelsize=39:foundry=GOOG:weight=normal:slant=normal:width=normal:scalable=true")))
  (add-to-list 'default-frame-alist '(vertical-scroll-bars . nil))
  ;; set scale here
  (set-face-attribute 'default nil :height 140)
  ;; (toggle-debug-on-error)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  (print "Started loading .spacemacs")
  (define-key evil-normal-state-map (kbd "C-w") #'save-buffer)
  (define-key evil-normal-state-map (kbd "C-q") #'evil-quit-all)

  (require 'menu-bar)
  (menu-bar-no-scroll-bar)

  (require 'vi-tilde-fringe)
  (spacemacs/toggle-vi-tilde-fringe-off)

  (add-hook 'after-make-frame-functions #'spacemacs/enable-transparency)
  ;; (add-hook 'after-make-frame-functions #'menu-bar-no-scroll-bar)
  (setq package-archives '(("melpa" . "http://melpa.org/packages/")
                          ("gnu" . "http://elpa.gnu.org/packages/")))

  (setq spacemacs--buffer-warnings nil)

  (require 'lsp-mode)
  (require 'lsp)
  (add-hook 'c++-mode-hook #'lsp)
  (add-hook 'python-mode-hook #'lsp)
  (add-hook 'rust-mode-hook #'lsp)

  (require 'flycheck)
  (require 'lsp-ui-flycheck)
  (require 'ccls)

  (require 'lsp-ui)
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'lsp-ui-mode-hook 'flycheck-mode)

  (setq lsp-prefer-flymake nil)
  (add-hook 'c++-mode-hook #'lsp)

  (setq ccls-executable "/var/lib/snapd/snap/bin/ccls")
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))

  (require 'company)
  (eval-after-load "company"
    '(add-to-list 'company-backends 'company-anaconda))

  (setq-default
   js2-indent-level 2
   css-indent-offset 2
   web-mode-markup-indent-offset 2
   julia-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-attr-indent-offset 2)

  (require 'smartparens)
  (sp-pair "\{" "\}" :actions :rem)

  ;; to stop d from deleting lines
  (defun stop-using-minibuffer ()
    "kill the minibuffer"
    (when (and (>= (recursion-depth) 1) (active-minibuffer-window))
      (abort-recursive-edit)))

  (add-hook 'mouse-leave-buffer-hook 'stop-using-minibuffer)

  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines))

  (require 'org)
  (plist-put org-format-latex-options :scale 1.5)
  (setq org-src-fontify-natively t
        org-src-preserve-indentation t
        org-src-tab-acts-natively t)

  (add-hook 'org-babel-after-execute-hook 'org-display-inline-images)
  (setq org-confirm-babel-evaluate nil)

  (require 'julia-mode)

  (require 'sublimity-scroll)
  (setq sublimity-scroll-weight 10
        sublimity-scroll-drift-length 0)
  (sublimity-mode 1)
  (pixel-scroll-mode)
  (setq pixel-dead-time 0) ; Never go back to the old scrolling behaviour.
  (setq pixel-resolution-fine-flag t) ; Scroll by number of pixels instead of lines (t = frame-char-height pixels).
  (setq mouse-wheel-scroll-amount '(1)) ; Distance in pixel-resolution to scroll each mouse wheel event.
  (setq mouse-wheel-progressive-speed nil) ; Progressive speed is too fast for me.

  (require 'evil-surround)
  (setq-default evil-surround-pairs-alist
                (push '(?l . ("$$" . "$$")) evil-surround-pairs-alist))

  ;;;; ------------------------------------------------------------------------------------

  ;; (add-hook 'prog-mode-hook #'(lambda () (modify-syntax-entry ?_ "w")))
  (global-set-key (kbd "C-q") #'delete-window)
  (define-key evil-normal-state-map (kbd "C-w") #'save-buffer)
  (define-key evil-motion-state-map (kbd "'") #'evil-goto-mark) ;; jump to column as well
  (define-key evil-motion-state-map (kbd "C-i") #'evil-jump-forward)

  ;; (define-key evil-insert-state-map (kbd "<C-tab>") #'completion-at-point)
  ;; (define-key evil-normal-state-map (kbd "<C-tab>") #'completion-at-point)
  (define-key evil-motion-state-map (kbd "`") #'evil-goto-mark-line)

  (define-key evil-insert-state-map (kbd "<C-j>") #'evil-next-line)
  (define-key evil-insert-state-map (kbd "<C-k>") #'evil-next-line)
  (define-key evil-insert-state-map (kbd "<M-j>") #'indent-new-comment-line)

  (define-key evil-normal-state-map (kbd "C-+") #'spacemacs/zoom-frm-in)
  (define-key evil-normal-state-map (kbd "C--") #'spacemacs/zoom-frm-out)

  ;;;; Spaceline
  (spaceline-toggle-hud-off)
  (custom-set-faces
   '(spaceline-highlight-face ((t (:foreground "..." :background "..." ...)))))

  (require 'olivetti)
  (add-hook 'prog-mode-hook 'olivetti-mode)
  (add-hook 'markdown-mode-hook 'olivetti-mode)
  (add-hook 'text-mode-hook 'olivetti-mode)
  (add-hook 'conf-mode-hook 'olivetti-mode)
  (add-hook 'magit-mode-hook 'olivetti-mode)
  ;; (add-hook 'olivetti-mode #'spacemacs/toggle-vi-tilde-fringe-off)
  ;; (add-hook 'olivetti-mode #'menu-bar-no-scroll-bar)


  ;;;; Finally, setup org mode -
  ;;; the setup makes it prettier, and adds some custom functions for adding images inline

  (defun my/org-screenshot ()
    "Take a screenshot into a time stamped unique-named file in the sub-directory (%filenameIMG) as the org-buffer and insert a link to this file."
    (interactive)
    (setq myvar/img-folder-path (concat default-directory "img/"))

    (if (not (file-exists-p myvar/img-folder-path)) ;[ ] refactor thir and screenshot code.
        (mkdir myvar/img-folder-path))

    (setq myvar/img-name (concat (file-name-sans-extension ( buffer-name )) "_" (format-time-string "%Y_%m_%d__%H:%M:%S") ".png"))
    (setq myvar/img-abs-path (concat myvar/img-folder-path myvar/img-name)) ;Relative to workspace.

    (setq myvar/relative-filename (concat "./img/" myvar/img-name))
    (insert "#+ATTR_ORG: :width 750 \n")
    (insert "[[" myvar/relative-filename "]]" "\n")

    (lower-frame)
    (call-process "flameshot-capture" nil nil nil myvar/img-abs-path)
    (raise-frame)
                                          (make-frame-visible)
    (org-display-inline-images))


  (defun my/org-paste-from-clipboard ()
    "Puts clipboard png image into a time stamped unique-named file in the sub-directory (%filenameIMG) as the org-buffer and insert a link to this file."
    (interactive)
    (setq myvar/img-folder-path (concat default-directory "img/"))

    (if (not (file-exists-p myvar/img-folder-path)) ;[ ] refactor thir and screenshot code.
        (mkdir myvar/img-folder-path))

    (setq myvar/img-name (concat (file-name-sans-extension ( buffer-name )) "_" (format-time-string "%Y_%m_%d__%H:%M:%S") ".png"))
    (setq myvar/img-abs-path (concat myvar/img-folder-path myvar/img-name)) ;Relative to workspace.

    (setq myvar/relative-filename (concat "./img/" myvar/img-name))
    (insert "#+ATTR_ORG: :width 750 \n")
    (insert "[[" myvar/relative-filename "]]" "\n")

                                          ;(make-frame-invisible)
    (lower-frame)
    (call-process "move-png-clipboard" nil nil nil myvar/img-abs-path)
    ;; (call-process "/home/michael/Program/bin/img-from-clip" nil nil nil myvar/img-Abs-Path)
    (raise-frame)
                                          ;(make-frame-visible)
    (org-display-inline-images))

  (defun my/org-render-latex-fragments ()
          (if (org--list-latex-overlays)
              (progn (org-toggle-latex-fragment)
                      (org-toggle-latex-fragment))
            (org-toggle-latex-fragment)))

  (defun org/my-init-org ()
    (require 'org)
    (require 'writegood-mode)
    (require 'olivetti)
    ;;; new key bindings
    (org-defkey evil-motion-state-map (kbd "<down>") #'org-next-visible-heading)
    (org-defkey evil-motion-state-map (kbd "<up>") #'org-previous-visible-heading)
    (org-defkey evil-motion-state-map (kbd "<right>") #'org-cycle)
    (org-defkey evil-motion-state-map (kbd "<left>") #'org-shifttab)
    (org-defkey evil-motion-state-map (kbd "<C-M-down>") #'org-forward-heading-same-level)
    (org-defkey evil-motion-state-map (kbd "<C-M-up>") #'org-backward-heading-same-level)

    ;; visuals
    (setq org-startup-indented t
          org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
          org-ellipsis "  " ;; folding symbol
          org-pretty-entities t
          org-hide-emphasis-markers t
          org-blank-before-new-entry '((heading) (plain-list-item))

          ;; show actually italicized text instead of /italicized text/
          org-agenda-block-separator ""
          org-fontify-whole-heading-line t
          org-fontify-done-headline t
          org-fontify-quote-and-verse-blocks t)

    ;;;; hook
    (add-hook 'org-mode-hook
              '(lambda ()
                 (add-hook 'after-save-hook 'my/org-render-latex-fragments nil 'make-the-hook-local)
                 (setq line-spacing 0.2) ;; Add more line padding for readability
                 ;; (require 'writeroom-mode)
                 ;; (writeroom-mode)
                 ;; (writeroom-adjust-width 20)
                 (olivetti-mode)
                 (writegood-mode)
                 (spacemacs/enable-transparency)
                 (spacemacs/toggle-auto-fill-mode-on)
                 (spacemacs/toggle-mode-line)
                 (variable-pitch-mode 1) ;; All fonts with variable pitch.
                 (mapc
                  (lambda (face) ;; Other fonts with fixed-pitch.
                    (set-face-attribute face nil :inherit 'fixed-pitch))
                  (list 'org-code
                        'org-link
                        'org-block
                        'org-table
                        'org-verbatim
                        'org-block-begin-line
                        'org-block-end-line
                        'org-meta-line
                        'org-document-info-keyword))))
    (use-package org
      ;; :mode ("\\.org\\'" . org-mode)
      :bind
      (("C-c l" . org-store-link)
       ("C-c a" . org-agenda)
       ("C-c b" . org-iswitchb)
       ("C-c c" . org-capture))
      :bind
      (:map org-mode-map
            ("iS" . my/org-screenshot)
            ("ic" . my/org-paste-from-clipboard)
            ("M-n" . outline-next-visible-heading)
            ("M-p" . outline-previous-visible-heading))

      :custom
      (org-return-follows-link t)
      (org-agenda-diary-file "~/Library/Documents/diary.org")
      (org-babel-load-languages
       '((emacs-lisp . t)
         (python . t)))
      :custom-face
      (variable-pitch ((t (:family "ETBembo"))))
      (org-document-title ((t (:foreground "#075283" :weight bold :height 1.5)))))

   (setq org-startup-indented t
         org-bullets-bullet-list '(" ") ;; no bullets, needs org-bullets package
         org-ellipsis "  " ;; folding symbol
         org-pretty-entities t
         org-hide-emphasis-markers t
         ;; show actually italicized text instead of /italicized text/
         org-agenda-block-separator ""
         org-fontify-whole-heading-line t
         org-fontify-done-headline t
         org-fontify-quote-and-verse-blocks t))

  (org/my-init-org)

  (print "Reloaded .spacemacs!"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#262221" "#e84c58" "#91f368" "#eed891" "#41b0f3" "#cea2ca" "#6bd9db" "#eee6d3"])
 '(org-download-screenshot-method "flameshot gui --raw > %s")
 '(custom-safe-themes
   '("249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b" default))
 '(default-frame-alist
    '((font . "-GOOG-NotoSansMono Nerd Font-normal-normal-normal-*-29-*-*-*-*-0-iso10646-1")
      (buffer-predicate . spacemacs/useful-buffer-p)
      (font . "NotoSansMono Nerd Font:pixelsize=29:foundry=GOOG:weight=normal:slant=normal:width=normal:scalable=true")
      (alpha 80 . 100)))
 '(evil-want-Y-yank-to-eol nil)
 '(fill-column 100)
 '(linum-format " %3i ")
 '(lsp-julia-default-environment "~/.julia/environments/v1.4")
 '(org-log-done 'time)
 '(package-selected-packages
   '(rustic project xref paradox spinner mmm-mode evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-snipe evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree csv-mode company-auctex auctex adaptive-wrap kaolin-valley-dark-theme zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler writegood-mode winum white-sand-theme which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublimity sublime-themes subatomic256-theme subatomic-theme spray spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle smartparens slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pandoc-mode ox-pandoc ox-extra outline-toc orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file omtose-phellack-theme omnisharp olivetti oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc go-direx gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags gandalf-theme fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-unimpaired evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-escape eval-sexp-fu eterm-256color espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker django-theme disaster diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme company-web company-tern company-statistics company-quickhelp company-go company-c-headers company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmake-mode clues-theme clean-aindent-mode clang-format cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-window ace-link ace-jump-helm-line ac-ispell 0xc))
 '(pdf-view-midnight-colors '("#d0d6dc" . "#262221"))
 '(pos-tip-background-color "#2E2A29")
 '(pos-tip-foreground-color "#d4d4d6")
 '(powerline-default-separator nil)
 '(rust-indent-offset 2)
 '(spacemacs-yank-indent-threshold 0))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-plugin-defalt-face ((t (:background "maroon" :foreground "Black"))))
 '(ansi-color-names-vector ["#32302F" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#17CCD5" "#EBDBB2"])
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#689d6a")
 '(cua-normal-cursor-color "#a89984")
 '(cua-overwrite-cursor-color "#d79921")
 '(cua-read-only-cursor-color "#98971a")
 '(enh-ruby-op-face ((t (:foreground "light salmon"))))
 '(fci-rule-color "#32302f")
 '(highlight-changes-colors '("#d3869b" "#b16286"))
 '(highlight-symbol-colors (--map (solarized-color-blend it "#282828" 0.25) '("#d79921" "#689d6a" "#fb4933" "#b16286" "#98971a" "#d65d0e" "#458588")))
 '(highlight-symbol-foreground-color "#bdae93")
 '(highlight-tail-colors '(("#32302f" . 0) ("#747400" . 20) ("#2e7d33" . 30) ("#14676b" . 50) ("#a76e00" . 60) ("#a53600" . 70) ("#9f4d64" . 85) ("#32302f" . 100)))
 '(hl-bg-colors '("#a76e00" "#a53600" "#b21b0a" "#9f4d64" "#8b2a58" "#14676b" "#2e7d33" "#747400"))
 '(hl-fg-colors '("#282828" "#282828" "#282828" "#282828" "#282828" "#282828" "#282828" "#282828"))
 '(hl-paren-colors '("#689d6a" "#d79921" "#458588" "#b16286" "#98971a"))
 '(hl-todo-keyword-faces '(("TODO" . "#dc752f") ("NEXT" . "#dc752f") ("THEM" . "#2d9574") ("PROG" . "#4f97d7") ("OKAY" . "#4f97d7") ("DONT" . "#f2241f") ("FAIL" . "#f2241f") ("DONE" . "#86dc2f") ("NOTE" . "#b1951d") ("KLUDGE" . "#b1951d") ("HACK" . "#b1951d") ("TEMP" . "#b1951d") ("FIXME" . "#dc752f") ("XXX" . "#dc752f") ("XXXX" . "#dc752f")))
 '(js-indent-level 2)
 '(julia-indent-offset 2)
 '(linum-format " %3i ")
 '(nrepl-message-colors '("#fb4933" "#d65d0e" "#d79921" "#747400" "#b9b340" "#14676b" "#689d6a" "#d3869b" "#b16286"))
 '(org-agenda-diary-file "~/.org/diary.org")
 '(org-agenda-files '("~/Org/inbox.org"))
 '(org-babel-load-languages '((emacs-lisp . t) (python . t)))
 '(org-document-title ((t (:foreground "#075283" :weight bold :height 1.5))))
 '(org-done ((t (:background "#E8E8E8" :foreground "tan" :strike-through t :weight bold))))
 '(org-headline-done ((t (:foreground "#FFF8E2" :strike-through t))))
 '(org-level-1 ((t (:extend t :foreground "white" :weight bold :height 1.3))))
 '(org-level-2 ((t (:extend t :foreground "white" :weight normal :height 1.2))))
 '(org-level-3 ((t (:extend t :foreground "white" :weight normal :height 1.1))))
 '(org-return-follows-link t)
 '(org-todo ((t (:foreground "dark red" :weight bold))))
 '(package-selected-packages '(elixir-mode zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler writegood-mode winum white-sand-theme which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tide typescript-mode tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublimity sublime-themes subatomic256-theme subatomic-theme spray spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle smartparens slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el paradox pandoc-mode ox-pandoc ht ox-extra outline-toc orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file omtose-phellack-theme omnisharp olivetti oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow magit-popup magit madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint light-soap-theme js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hydra lv hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-mode-manager helm-make helm-gtags helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc go-direx direx gnuplot  gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md ggtags gandalf-theme fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-unimpaired evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter git-commit with-editor evil-escape goto-chg eval-sexp-fu eterm-256color xterm-color espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker transient tablist json-mode docker-tramp json-snatcher json-reformat django-theme disaster diminish diff-hl define-word darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csharp-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-quickhelp pos-tip company-go go-mode company-c-headers company-anaconda company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmake-mode clues-theme clean-aindent-mode clang-format cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed apropospriate-theme anti-zenburn-theme anaconda-mode pythonic f dash ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup 0xc s kaolin-valley-dark-theme))
 '(pdf-view-midnight-colors '("#FDF4C1" . "#282828"))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(powerline-active1 ((t (:inherit mode-line :background "tan"))))
 '(powerline-active2 ((t (:inherit mode-line))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#32302f" 0.2))
 '(spaceline-highlight-face ((t (:foreground "..." :background "..." \.\.\.))))
 '(standard-indent 4)
 '(term-default-bg-color "#282828")
 '(term-default-fg-color "#a89984")
 '(typescript-indent-level 2)
 '(variable-pitch ((t (:family "ETBembo"))))
 '(vc-annotate-color-map '((20 . "#fb4933") (40 . "#ea9077602ba7") (60 . "#e13d890d26e5") (80 . "#d79921") (100 . "#c25f98e11e8d") (120 . "#b7f4989b1d5e") (140 . "#ad7198331c37") (160 . "#a2cd97aa1b17") (180 . "#98971a") (200 . "#8b4b99073ab0") (220 . "#84009a084776") (240 . "#7bdf9b065366") (260 . "#72aa9c035ed9") (280 . "#689d6a") (300 . "#5c5b933c7677") (320 . "#55928e6e7c70") (340 . "#4de689af8246") (360 . "#458588")))
 '(weechat-color-list '(unspecified "#282828" "#32302f" "#b21b0a" "#fb4933" "#747400" "#98971a" "#a76e00" "#d79921" "#14676b" "#458588" "#9f4d64" "#d3869b" "#2e7d33" "#689d6a" "#a89984" "#282828"))
 '(xterm-color-names ["#32302f" "#fb4933" "#98971a" "#d79921" "#458588" "#d3869b" "#689d6a" "#a89984"])
 '(xterm-color-names-bright ["#282828" "#d65d0e" "#7c6f64" "#282828" "#a89984" "#b16286" "#bdae93" "#fbf1c7"]))

(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#262221" "#e84c58" "#91f368" "#eed891" "#41b0f3" "#cea2ca" "#6bd9db" "#eee6d3"])
 '(custom-safe-themes
   '("249e100de137f516d56bcf2e98c1e3f9e1e8a6dce50726c974fa6838fbfcec6b" default))
 '(default-frame-alist
    '((font . "-GOOG-NotoSansMono Nerd Font-normal-normal-normal-*-29-*-*-*-*-0-iso10646-1")
      (buffer-predicate . spacemacs/useful-buffer-p)
      (font . "NotoSansMono Nerd Font:pixelsize=29:foundry=GOOG:weight=normal:slant=normal:width=normal:scalable=true")
      (alpha 80 . 100)))
 '(evil-want-Y-yank-to-eol nil)
 '(fill-column 100)
 '(flycheck-clang-include-path nil)
 '(flycheck-clang-includes nil)
 '(flycheck-gcc-include-path nil)
 '(linum-format " %3i ")
 '(lsp-julia-default-environment "~/.julia/environments/v1.4")
 '(markdown-command "crowbook - -qs
--to html --output -")
 '(olivetti-body-width 0.8)
 '(org-download-screenshot-method "flameshot gui --raw > %s")
 '(org-log-done 'time)
 '(package-selected-packages
   '(magit-delta magit rustic project xref paradox spinner mmm-mode evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-snipe evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state iedit evil-exchange evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree csv-mode company-auctex auctex adaptive-wrap kaolin-valley-dark-theme zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler writegood-mode winum white-sand-theme which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tide tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublimity sublime-themes subatomic256-theme subatomic-theme spray spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle smartparens slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pandoc-mode ox-pandoc ox-extra outline-toc orgit organic-green-theme org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file omtose-phellack-theme omnisharp olivetti oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode live-py-mode linum-relative link-hint light-soap-theme js2-refactor js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc go-direx gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md ggtags gandalf-theme fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-unimpaired evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-escape eval-sexp-fu eterm-256color espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker django-theme disaster diminish diff-hl define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme company-web company-tern company-statistics company-quickhelp company-go company-c-headers company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmake-mode clues-theme clean-aindent-mode clang-format cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-window ace-link ace-jump-helm-line ac-ispell 0xc))
 '(pdf-view-midnight-colors '("#d0d6dc" . "#262221"))
 '(pos-tip-background-color "#2E2A29")
 '(pos-tip-foreground-color "#d4d4d6")
 '(powerline-default-separator nil)
 '(rust-indent-offset 2)
 '(scroll-bar-mode nil)
 '(spacemacs-yank-indent-threshold 0)
 '(warning-suppress-types '((use-package)))
 '(zoom-frame/buffer 'frame))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(ahs-plugin-defalt-face ((t (:background "maroon" :foreground "Black"))) t)
 '(ahs-plugin-default-face ((t (:background "maroon" :foreground "Black"))))
 '(ansi-color-names-vector ["#32302F" "#FB4934" "#B8BB26" "#FABD2F" "#83A598" "#D3869B" "#17CCD5" "#EBDBB2"])
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#689d6a")
 '(cua-normal-cursor-color "#a89984")
 '(cua-overwrite-cursor-color "#d79921")
 '(cua-read-only-cursor-color "#98971a")
 '(enh-ruby-op-face ((t (:foreground "light salmon"))))
 '(fci-rule-color "#32302f")
 '(highlight-changes-colors '("#d3869b" "#b16286"))
 '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t)
 '(highlight-symbol-colors (--map (solarized-color-blend it "#282828" 0.25) '("#d79921" "#689d6a" "#fb4933" "#b16286" "#98971a" "#d65d0e" "#458588")))
 '(highlight-symbol-foreground-color "#bdae93")
 '(highlight-tail-colors '(("#32302f" . 0) ("#747400" . 20) ("#2e7d33" . 30) ("#14676b" . 50) ("#a76e00" . 60) ("#a53600" . 70) ("#9f4d64" . 85) ("#32302f" . 100)))
 '(hl-bg-colors '("#a76e00" "#a53600" "#b21b0a" "#9f4d64" "#8b2a58" "#14676b" "#2e7d33" "#747400"))
 '(hl-fg-colors '("#282828" "#282828" "#282828" "#282828" "#282828" "#282828" "#282828" "#282828"))
 '(hl-paren-colors '("#689d6a" "#d79921" "#458588" "#b16286" "#98971a"))
 '(hl-todo-keyword-faces '(("TODO" . "#dc752f") ("NEXT" . "#dc752f") ("THEM" . "#2d9574") ("PROG" . "#4f97d7") ("OKAY" . "#4f97d7") ("DONT" . "#f2241f") ("FAIL" . "#f2241f") ("DONE" . "#86dc2f") ("NOTE" . "#b1951d") ("KLUDGE" . "#b1951d") ("HACK" . "#b1951d") ("TEMP" . "#b1951d") ("FIXME" . "#dc752f") ("XXX" . "#dc752f") ("XXXX" . "#dc752f")))
 '(js-indent-level 2)
 '(julia-indent-offset 2)
 '(linum-format " %3i ")
 '(nrepl-message-colors '("#fb4933" "#d65d0e" "#d79921" "#747400" "#b9b340" "#14676b" "#689d6a" "#d3869b" "#b16286"))
 '(org-agenda-diary-file "~/.org/diary.org")
 '(org-agenda-files '("~/Org/inbox.org"))
 '(org-babel-load-languages '((emacs-lisp . t) (python . t)))
 '(org-document-title ((t (:foreground "#075283" :weight bold :height 1.5))))
 '(org-done ((t (:background "#E8E8E8" :foreground "tan" :strike-through t :weight bold))))
 '(org-headline-done ((t (:foreground "#FFF8E2" :strike-through t))))
 '(org-level-1 ((t (:extend t :foreground "white" :weight bold :height 1.3))))
 '(org-level-2 ((t (:extend t :foreground "white" :weight normal :height 1.2))))
 '(org-level-3 ((t (:extend t :foreground "white" :weight normal :height 1.1))))
 '(org-return-follows-link t)
 '(org-todo ((t (:foreground "dark red" :weight bold))))
 '(package-selected-packages '(elixir-mode zenburn-theme zen-and-art-theme yapfify yaml-mode ws-butler writegood-mode winum white-sand-theme which-key web-mode web-beautify volatile-highlights vimrc-mode vi-tilde-fringe uuidgen use-package unfill underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme toxi-theme toc-org tide typescript-mode tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublimity sublime-themes subatomic256-theme subatomic-theme spray spaceline powerline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle smartparens slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme popwin planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el paradox pandoc-mode ox-pandoc ht ox-extra outline-toc orgit organic-green-theme org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-plus-contrib org-mime org-download org-bullets open-junk-file omtose-phellack-theme omnisharp olivetti oldlace-theme occidental-theme obsidian-theme noctilux-theme neotree naquadah-theme mwim mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow magit-popup magit madhat2r-theme macrostep lush-theme lua-mode lorem-ipsum livid-mode skewer-mode simple-httpd live-py-mode linum-relative link-hint light-soap-theme js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme inkpot-theme indent-guide hydra lv hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation heroku-theme hemisu-theme helm-themes helm-swoop helm-pydoc helm-projectile projectile helm-mode-manager helm-make helm-gtags helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio go-guru go-eldoc go-direx direx gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md ggtags gandalf-theme fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exotica-theme exec-path-from-shell evil-unimpaired evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter git-commit with-editor evil-escape goto-chg eval-sexp-fu eterm-256color xterm-color espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav dumb-jump dracula-theme dockerfile-mode docker transient tablist json-mode docker-tramp json-snatcher json-reformat django-theme disaster diminish diff-hl define-word darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme dactyl-mode cython-mode cyberpunk-theme csharp-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-quickhelp pos-tip company-go go-mode company-c-headers company-anaconda company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmake-mode clues-theme clean-aindent-mode clang-format cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed apropospriate-theme anti-zenburn-theme anaconda-mode pythonic f dash ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup 0xc s kaolin-valley-dark-theme))
 '(pdf-view-midnight-colors '("#FDF4C1" . "#282828"))
 '(pos-tip-background-color "#36473A")
 '(pos-tip-foreground-color "#FFFFC8")
 '(powerline-active1 ((t (:inherit mode-line :background "tan"))))
 '(powerline-active2 ((t (:inherit mode-line))))
 '(powerline-inactive1 ((t (:inherit mode-line-inactive))))
 '(powerline-inactive2 ((t (:inherit mode-line-inactive))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#98971a" "#32302f" 0.2))
 '(spaceline-highlight-face ((t (:foreground "..." :background "..." \.\.\.))))
 '(standard-indent 4)
 '(term-default-bg-color "#282828")
 '(term-default-fg-color "#a89984")
 '(typescript-indent-level 2)
 '(variable-pitch ((t (:family "ETBembo"))))
 '(vc-annotate-color-map '((20 . "#fb4933") (40 . "#ea9077602ba7") (60 . "#e13d890d26e5") (80 . "#d79921") (100 . "#c25f98e11e8d") (120 . "#b7f4989b1d5e") (140 . "#ad7198331c37") (160 . "#a2cd97aa1b17") (180 . "#98971a") (200 . "#8b4b99073ab0") (220 . "#84009a084776") (240 . "#7bdf9b065366") (260 . "#72aa9c035ed9") (280 . "#689d6a") (300 . "#5c5b933c7677") (320 . "#55928e6e7c70") (340 . "#4de689af8246") (360 . "#458588")))
 '(weechat-color-list '(unspecified "#282828" "#32302f" "#b21b0a" "#fb4933" "#747400" "#98971a" "#a76e00" "#d79921" "#14676b" "#458588" "#9f4d64" "#d3869b" "#2e7d33" "#689d6a" "#a89984" "#282828"))
 '(xterm-color-names ["#32302f" "#fb4933" "#98971a" "#d79921" "#458588" "#d3869b" "#689d6a" "#a89984"])
 '(xterm-color-names-bright ["#282828" "#d65d0e" "#7c6f64" "#282828" "#a89984" "#b16286" "#bdae93" "#fbf1c7"]))
)
