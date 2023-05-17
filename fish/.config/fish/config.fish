if status is-interactive
    # Commands to run in interactive sessions can go here
end

# export PATH='$HOME/.local/bin':$PATH

# rust cargo
set -Ua fish_user_paths $HOME/.cargo/bin
# rust cargo end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting # Supresses fish's intro message

# Setup oh-my-posh with default theme
#oh-my-posh init fish | source

# Setup oh-my-posh with custom default theme
oh-my-posh init fish --config "$(brew --prefix oh-my-posh)"/themes/jblab_2021.omp.json | source


abbr -a fconfig 'nvim ~/.config/fish/config.fish'
abbr -a sf '. ~/.config/fish/config.fish'
abbr -a xf 'exec fish'
abbr -a sconf 'source /Users/matic/.config/fish/conf.d/fnm.fish'

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
    fish_default_key_bindings
    # fish_vi_key_bindings
end
### END OF VI MODE ###

### Nerd Font Install ###
function nerd_font_install
    brew install --cask font-$argv-nerd-font
end

# autojump path
alias autojumpdb ='$HOME/Library/autojump/autojump.txt'

### AUTOCOMPLETE AND HIGHLIGHT COLORS ###
set fish_color_normal brcyan
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command brcyan
set fish_color_error '#ff6c6b'
set fish_color_param brcyan

# Functions needed for !! and !$
function take
    mkdir $argv; cd $argv
end

# Functions needed for !! and !$
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end
# The bindings for !! and !$
if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
function coln
    while read -l input
        echo $input | awk '{print $'$argv[1]'}'
    end
end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Zoxide
zoxide init fish | source

# Oh My Posh
abbr -a poshThemes 'z "$(brew --prefix oh-my-posh)"/themes'

## Setting a theme with Oh-My-Posh
function setPoshTheme
    eval "$(oh-my-posh init fish --config "$(brew --prefix oh-my-posh)"/themes/$argv.omp.json)"
end

# Aliases
alias zconfig='nvim ~/.zshrc'

# abbr TLDR
abbr -a m 'tldr'
abbr -a mud 'tldr -u'

# switch between shells
# I do not recommend switching default SHELL from bash.
abbr tobash "sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
abbr tozsh "sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
abbr tofish "sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# # Clear

abbr -a c 'clear'

abbr -a md 'mkdir -pv'

# handy shortcuts
alias h='history'

# Set vim as default
alias vi=nvim
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='nvim'

## PNPM
abbr -a t3 'pnpm create t3-app@latest'
abbr -a vit 'pnpm create vite@latest'
abbr -a pn 'pnpm'
abbr -a pni 'pnpm install'
abbr -a pna 'pnpm add'
abbr -a pnad 'pnpm add -D'
abbr -a pnag 'pnpm add -g'
abbr -a pnu 'pnpm up' # Updates all dependencies, adhering to ranges specified in package.json
abbr -a pnul 'pnpm up --latest' # Updates all dependencies, ignoring ranges specified in package.json
abbr -a pnug 'pnpm up --global' # Update global packages.
abbr -a pnrm 'pnpm rm' # removes a dependency
abbr -a pnrmg 'pnpm rm -g' # Remove a global package.
abbr -a pnrmd 'pnpm rm -D' # Only remove the dependency from devDependencies.

# Use netstat command to quickly list all TCP/UDP port on the server:
alias ports='netstat -tulanp'

# do not delete / or prompt if deleting more than 3 files at a time #
abbr -a tp 'trash-put'    # trash files and directories.
abbr -a te 'trash-empty'   # empty the trashcan(s).
abbr -a tl 'trash-list'    # list trashed files.
abbr -a tre 'trash-restore' # restore a trashed file.
abbr -a trm 'trash-rm'     # remove individual files from the trashcan.

# become root #
abbr -a root 'sudo -i'
abbr -a su 'sudo -i'

## get rid of command not found ##
alias cd..='cd ..'

# navigation
alias ..='z ..'
alias ...='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Git commands
abbr -a gs 'git status'
abbr -a gst 'git status -sb'
abbr -a gl 'git log'
abbr -a ga 'git add'
abbr -a gaa 'git add -A'
abbr -a gal 'git add .'
abbr -a gall 'git add .'
abbr -a gca 'git commit -a'
abbr -a gc 'git commit -m'
abbr -a gcot 'git checkout'
abbr -a gchekout 'git checkout'
abbr -a gchckout 'git checkout'
abbr -a gckout 'git checkout'
abbr -a go 'git push -u origin'
abbr -a gsh 'git stash'
abbr -a gw 'git whatchanged'
abbr -a gitlg "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
abbr -a nah "git clean -df && git checkout -- ."

# Exit Command
alias :q='exit'
alias ext='exit'
alias xt='exit'
alias by='exit'
alias bye='exit'
alias die='exit'
alias quit='exit'

# Launch Simple HTTP Server
alias serve='python -m SimpleHTTPServer'

# Confirmation
abbr -a mv 'mv -i'
abbr -a cp 'cp -i'
abbr -a ln 'ln -i'
abbr -a rm 'rm -I --preserve-root'

### AutoJump #####
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish
# Setting PATH for Python 3.11
# The original version is saved in /Users/matic/.config/fish/config.fish.pysave
# set -x PATH "/Library/Frameworks/Python.framework/Versions/3.11/bin" "$PATH"

# pnpm
set -gx PNPM_HOME "/Users/matic/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

