#!/bin/sh

# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/share/go/bin:$PATH
export GOPATH=$HOME/.local/share/go
export PATH=$HOME/.fnm:$PATH
export PATH="$HOME/.local/share/neovim/bin":$PATH
export XDG_CURRENT_DESKTOP="Wayland"
export PATH="/usr/local/opt/llvm@15/bin:$PATH"
export PATH="/usr/local/opt/ssh-copy-id/bin:$PATH"
export PATH=$PATH:/Users/matic/.spicetify
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml

# export NVIM_APPNAME="nvim-AstroNvim"
export NVIM_APPNAME="nvim-AstroNvim"

#export PATH="$PATH:./node_modules/.bin"
eval "$(fnm env)"
eval "$(zoxide init zsh)"
eval $(thefuck --alias)
eval "$(starship init zsh)"
# eval "`pip completion --zsh`"

# default nvim
# export NVIM_APPNAME="nvim-Lazyman"
