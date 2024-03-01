#!/bin/sh

alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"

# autojump path
# alias autojumpdb ='$HOME/Library/autojump/autojump.txt'

# Aliases

# zsh
alias sz='source ~/.zshrc'
alias zconfig='nvim ~/.zshrc'
alias ohmyzsh='nvim ~/.oh-my-zsh'
alias ezsh='exec zsh'

# fish
alias fconfig='nvim ~/.config/fish/config.fish'
alias sf='. ~/.config/fish/config.fish'
alias xf='exec fish'
alias sconf='source /Users/matic/.config/fish/conf.d/fnm.fish'

# rust
alias rs='rustc'
alias cr='cargo'
alias ru='rustup'

# Python

alias python='python3'
# alias pip='pip3 -m'

alias py='python3'
alias pi='python3 -m pip3 install'
alias pu='python3 -m pip3 uninstall'

# abbr TLDR
alias m='tldr'
alias mud='tldr -u'

alias b='bun'
alias br='bun run'
alias bh='bun --hot'
alias bb='bun build'
alias bx='bunx'
alias ba='bun add'
alias bad='bun add -d'
alias bag='bun add -g'
alias bc='bun create'
alias bi='bun install'
alias bii='bun init'
alias bu='bun update'
alias bl='bun link'
alias brm='bun remove'
alias bul='bun unlink'
alias bd='bun dev'
alias bug='bun upgrade'
alias bt='bun test'

# tmux
alias t='tmux'
alias ta='tmux a'
alias tls='tmux ls'
alias tlss='tmux list-sessions'
alias tnew='tmux new -s'
alias tk='tmux kill-session -t'
alias tka='tmux kill-session -a'
alias tlk='tmux list-keys'

# switch between shells
# I do not recommend switching default SHELL from bash.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# # Clear
alias c='clear'

alias md='mkdir -pv'

# handy shortcuts 
alias h='history'

# Set vim as default
alias vi=vi
alias svi='sudo vi'
alias vis='vim "+set si"'
alias edit='nvim'

## PNPM
alias t3='pnpm create t3-app@latest'
alias vit='pnpm create vite@latest'
alias pn='pnpm'
alias pni='pnpm install'
alias pna='pnpm add'
alias pnad='pnpm add -D'
alias pnag='pnpm add -g'
alias pnu='pnpm up' # Updates all dependencies, adhering to ranges specified in package.json
alias pnul='pnpm up --latest' # Updates all dependencies, ignoring ranges specified in package.json
alias pnug='pnpm up --global' # Update global packages.
alias pnrm='pnpm rm' # removes a dependency
alias pnrmg='pnpm rm -g' # Remove a global package.
alias pnrmd='pnpm rm -D' # Only remove the dependency from devDependencies.

# Use netstat command to quickly list all TCP/UDP port on the server:
alias ports='netstat -tulanp'

# do not delete / or prompt if deleting more than 3 files at a time #
alias tp='trash-put'    # trash files and directories.
alias te='trash-empty'   # empty the trashcan(s).
alias tl='trash-list'    # list trashed files.
alias tre='trash-restore' # restore a trashed file.
alias trm='trash-rm'     # remove individual files from the trashcan.

# become root #
alias root='sudo -i'
alias su='sudo -i'

## get rid of command not found ##
alias cd..='cd ..'

# navigation
alias ..='z ..'
alias ...='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'

# Changing "ls" to "eza"
alias l='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Git commands
alias gs='git status'
alias gst='git status -sb'
alias gl='git log'
alias ga='git add'
alias gaa='git add -A'
alias gal='git add .'
alias gall='git add .'
alias gca='git commit -a'
alias gc='git commit -m'
alias gcot='git checkout'
alias gchekout='git checkout'
alias gchckout='git checkout'
alias gckout='git checkout'
alias gpo='git push -u origin'
alias gsh='git stash'
alias gw='git whatchanged'
alias gitlg="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias nah='git clean -df && git checkout -- .'

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
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias rm='rm -I --preserve-root'
