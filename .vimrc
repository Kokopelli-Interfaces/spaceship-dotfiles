set nocompatible " be iMproved, required
filetype off " required
filetype plugin on
filetype plugin indent on " required
set rtp+=~/.vim/bundle/Vundle.vim
"set the runtime path to include Vundle and initialize
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" VUNDLE - Plugin Manager for Vim, must be installed for this .vimrc -----------------------------"
" :PluginList - lists configured plugins
" :PluginInstall - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean - confirms removal of unused plugins; append `!` to auto-approve removal

" List Plugins we want to use -----------------------
    " let Vundle manage Vundle, required
    Plugin 'VundleVim/Vundle.vim'

"Passive Plugins {
    "Themes and visuals
    Plugin 'vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'terryma/vim-smooth-scroll'
    Plugin 'mhinz/vim-startify'
    Plugin 'rafi/awesome-vim-colorschemes'
    Plugin 'christoomey/vim-tmux-navigator'
    Plugin 'ConradIrwin/vim-bracketed-paste'
    " more visual feedback with regex and search (/ ? g/)"
    Plugin 'markonm/traces.vim'
    Plugin 'haya14busa/incsearch.vim'
    " use . to repeat plugin commands too"
    Plugin 'tpope/vim-repeat'
    "<Leader>wr{<, >, =, -, ...} To resize windows.
    " (operator)(i/a)c "
    Plugin 'glts/vim-textobj-comment'
    Plugin 'kana/vim-textobj-user'
    " (operator)(i/a)(i/I)"
    Plugin 'michaeljsmith/vim-indent-object'
"}

"Faster Editting
  Plugin 'scrooloose/nerdcommenter'
  "<Leader>1
  Plugin 'Chiel92/vim-autoformat'
"}

" One time I was bored, so I made a 'writing mode' for vim."
" to turn a buffer into a pretty, write-mode buffer, uncomment these plugins and
" the write mode configuration section and type <leader>mw
"Writing + Notes {
  Plugin 'junegunn/limelight.vim'
  Plugin 'junegunn/goyo.vim'
" }


call vundle#end() " required


" ------------------ End Plugin List for Vundle -----------------------

"Leader {
    "Leader mapping, this is the CAPSLOCK key for me, I set it on linux with the command:
    " xmodmap -e "keycode 66=0x60"
    let mapleader = " "
    " I use the leader key for most of my custom plugin mappings, each mapping
    " usually has two letters, the first one indicates a general functionality
    " (eg. `w = vimwiki bindings) and the 2nd is more specific command in that
    " functionality.

    " Leader mapping table
    " <Leader><Space> (key) -> file navigation (FZF, AG, Cscope)
    " <Leader>c     (key) -> comments (nerd-commenter)
    " <Leader>g     (key) -> git & fugitive
    " <Leader>t     (key) -> text (grammarly, spelling, wordy)
    " <Leader>w     (key) -> window control & tabs % session
    " <Leader>m     (key) -> change mode
    " <Leader>r     (key) -> refractor
"}

" Machine configuration - might be different for you  {
    execute "set <A-j>='^[j'"
    execute "set <A-k>='^[k'"
    set term=xterm-256color
    set t_Co=256
    if &term =~ '256color'
    " disable Background Color Erase (BCE) so that color schemes
    " render properly when inside 256-color tmux and GNU screen.
    " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
    set t_ut=
    endif
" }

" vimGui options {
    " set guioptions-=T "remove toolbar
    " set guioptions-=r "remove right-hand scroll bar
    " set guioptions-=L "remove left-hand scroll bar
    if (has("termguicolors"))
      set termguicolors
    endif
"}

" Non Plugin Bindings {
    " reload all buffers, vimrc, and redaw
    nmap <silent> <Leader>feR :edit<CR>:source ~/.vimrc<CR>:redraw!<CR>
    "paste mode (so vim dosen't autoindent)
    set pastetoggle=<F3>

    " Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
    map Y y$

    " change pwd for current window"
    nnoremap  <Leader>cd :lcd %:p:h<CR>
    " change pwd for all window"
    nnoremap  <Leader>CD :cd %:p:h<CR>

    " easier save and quit
    nnoremap <Leader>wr <C-w>
    nnoremap <C-w> :w<CR>
    nnoremap Q :q<CR>

   " press f9 to execute current file
    nnoremap <F9> :!%:p<CR>

    " stop reaching up to esc everytime! instead, mash jk
    imap jk <Esc>

    " With text selected in visual mode, if one presses Ctrl+R, then you can type a string and all
    " instances of the text are replaced with the string. Also,
    vnoremap <C-r> y:%s/<C-r>"//g<left><left>

    "Windows + Tabs {
    " Switch window mappings
        nmap <silent> <Leader>wh :wincmd h<CR>
        nmap <silent> <Leader>wj :wincmd j<CR>
        nmap <silent> <Leader>wk :wincmd k<CR>
        nmap <silent> <Leader>wl :wincmd l<CR>

        "easier tab switching
        "H left, L right
        nnoremap H gT
        nnoremap L gt

        nnoremap <silent> <Leader>wt :tabnew<CR>
        nnoremap <silent> <Leader>w/ :vsplit \| wincmd l<CR>
        nnoremap <silent> <Leader>w- :split \| wincmd j<CR>
    "}
"}

"Visuals {
    syntax enable
    set number
    set background=dark
    set laststatus=2
    colorscheme deep-space
    let g:airline_theme='bubblegum'
    set noshowmode
    set showcmd "Show partial commands
    set cmdheight=1
"}

""

" File Specific {
    " tablengths {
    " tabstop : The width of a hard tabstop measured in "spaces"
    set ts=4
    " shiftwidth : The size of an "indent".
    set sw=4
    " softtabstop - Setting this to a non-zero value other than tabstop
    " will make the tab key (in insert mode) insert a combination of
    " spaces (and possibly tabs) to simulate tab stops at this width.
    set softtabstop=4
    " expandtab
    " Enabling this will make the tab key (in insert mode) insert spaces instead of tab characters. This also affects the behavior of the retab command.
    set expandtab
    " smarttab
    " Enabling this will make the tab key (in insert mode) insert spaces or tabs to go to the next indent of the next tabstop when the cursor is at the beginning of a line (i.e. the only preceding characters are whitespace).
    set smarttab
    " File specific indentation {
        augroup indentation
            au Filetype verilog setlocal ts=1 sw=2 softtabstop=2 expandtab autoindent
            au Filetype javascript setlocal ts=2 sw=2 softtabstop=2 expandtab autoindent
            au Filetype json setlocal ts=2 sw=2 softtabstop=2 expandtab autoindent
            au Filetype systemverilog setlocal ts=2 sw=2 expandtab autoindent
            au Filetype c setlocal ts=8 sw=8 expandtab autoindent
        augroup END
    " }
  "}
"}

" Settings {
  " this disables automatic comment insertion
  "don't know what this is for tbh
  set sessionoptions+=tabpages,globals
" }

" ------------------ Plugin Configuration -------------------------- {
"Incseach {
  map /  <Plug>(incsearch-forward)
  map ?  <Plug>(incsearch-backward)
  map g/ <Plug>(incsearch-stay)
"}
"Autoformat {
    nmap <Leader>ra :Autoformat<CR>
"}
"NerdCommenter {
    " <command>ac -- around comments
    " <command>ic -- in comments
    " <leader>cA Append comment
    " <leader>cc comment
    " <leader>cSpace toggle comment
    " <leader>cm minimal comment
    " <leader>cs block comment
    let g:NERDSpaceDelims = 1
    let g:NERDAltDelims_c = 1
    let g:NERDAltDelims_systemverilog = 1
    let NERDLPlace="// /*"
    let NERDRPlace="*/"
    let g:NERDCompactSexyComs = 0
    let g:NERDDefaultAlign = 'left'
    noremap <Leader>ce :call NERDComment(0,"append")<CR>
    " disable auto comment insertion when pressing enter
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
"}

"Startify {
    "Startify compatible with NERDTree
    map <Leader><Space>h :Startify<CR>
    " save session "
    map <Leader>wS :SSave<CR>
    let g:startify_session_dir = '$HOME/.vim/session/'
    let g:startify_change_to_dir = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_session_persistence = 1
"}

"Smooth scroll {
    nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 5, 2)<CR>
    nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 5, 2)<CR>
    nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 3, 4)<CR>
    nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 3, 4)<CR>

    " Change these to your scrolling settings
    let g:smooth_scroll_duration = 3
    let g:smooth_scroll_speed = 4

    " Extra Smooth scrolling {
        nnoremap <silent> zz :call Smoothzz()<CR>
        function! Smoothzz()
            let s:origLine = line(".")
            let s:origCurs = col(".")
            let s:absTop = line("w0")

            " count visble difference to top
            let s:visTopDif = 0
            while (line('.') > s:absTop )
                normal 1k
                let s:visTopDif = s:visTopDif + 1
            endwhile

            let s:visCenter = winheight(".") /2
            let s:visDifToCenter = s:visCenter - s:visTopDif

            if (s:visDifToCenter > 0)  "scroll up by the #visiblelines & return
                let s:arglist = [s:visDifToCenter, g:smooth_scroll_duration, g:smooth_scroll_speed]
                call call(function('smooth_scroll#up'), s:arglist)
            else
                let s:arglist = [s:visDifToCenter*-1, g:smooth_scroll_duration, g:smooth_scroll_speed]
                call call(function('smooth_scroll#down'), s:arglist)
            endif
            call cursor(s:origLine, s:origCurs)
        endfunction

        nnoremap <silent> zt :call Smoothzt()<CR>
        function! Smoothzt()
            let s:curLine = line(".")
            let s:curCurs = col(".")
            let s:absTop =  line("w0")
            let s:visTopDif = 0
            while (line('.') > s:absTop )
                normal 1k
                let s:visTopDif = s:visTopDif + 1
            endwhile
            let s:arglist = [s:visTopDif+3, g:smooth_scroll_duration, g:smooth_scroll_speed]
            call call(function('smooth_scroll#down'), s:arglist)
            call cursor(s:curLine, s:curCurs)
        endfunction

        nnoremap <silent> zb :call Smoothzb()<CR>
        function! Smoothzb()
            let s:curLine = line(".")
            let s:curCurs = col(".")
            let s:absTop =  line("w0")
            let s:visTopDif = 0

            " counts difference to top
            while (line('.') > s:absTop )
                normal 1k
                let s:visTopDif = (s:visTopDif + 1)
            endwhile

            let s:visBotDif = winheight(".") - s:visTopDif
            let s:arglist = [s:visBotDif+3, g:smooth_scroll_duration, g:smooth_scroll_speed]
            call call(function('smooth_scroll#up'), s:arglist)
            call cursor(s:curLine, s:curCurs)
        endfunction
    "}
"}

"}
" Writing plugins {
     "Limelight {
     " Color name (:help cterm-colors) or ANSI code
         " Default: 0.5
         let g:limelight_default_coefficient = 0.7
         " Limelight
         let g:limelight_conceal_guifg = 'DarkGray'
         " Number of preceding/following paragraphs to include (default: 0)
         let g:limelight_paragraph_span = 0
     "}
" FZF {
    "search for files in a fuzzy way
    nmap <Leader>ff :FZF<CR>
    set rtp+=~/.fzf
    " Customize fzf colors to match your color scheme
    let g:fzf_colors =
    \ { 'fg':      ['fg', 'Normal'],
      \ 'bg':      ['bg', 'Normal'],
      \ 'hl':      ['fg', 'Comment'],
      \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
      \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
      \ 'hl+':     ['fg', 'Statement'],
      \ 'info':    ['fg', 'PreProc'],
      \ 'border':  ['fg', 'Ignore'],
      \ 'prompt':  ['fg', 'Conditional'],
      \ 'pointer': ['fg', 'Exception'],
      \ 'marker':  ['fg', 'Keyword'],
      \ 'spinner': ['fg', 'Label'],
      \ 'header':  ['fg', 'Comment'] }
" }

nnoremap <silent> <c-j> :TmuxNavigateDown<cr>

" } -------------------------------- End Plugin Configuration

  map <silent> <Leader>mw :call Writemode()<CR>
  function! Writemode() abort
    set nonumber
    Limelight .5
    Goyo 50%
    colorscheme jellybeans
    hi! EndOfBuffer guibg=bg guifg=bg
    "better paragraph hopping
    noremap { {b$
    noremap } }w
  endfunction

  map <silent> <Leader>mc :call Codemode()<CR>
  function! Codemode() abort
    Limelight!
    set number
    Goyo!
    colorscheme deep-space
    noremap { {
    noremap } }
  endfunction
" }
