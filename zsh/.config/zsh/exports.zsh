#!/bin/sh

# HISTFILE="$XDG_DATA_HOME"/zsh/history
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
# export PATH=$HOME/.local/share/go/bin:$PATH
# export GOPATH=$HOME/.local/share/go
# Go path
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
# fnm path
export PATH=$HOME/.fnm:$PATH
# neovim path
export PATH="$HOME/.local/share/neovim/bin":$PATH
export XDG_CURRENT_DESKTOP="Wayland"
export PATH="/usr/local/opt/llvm@15/bin:$PATH"
export PATH="/usr/local/opt/ssh-copy-id/bin:$PATH"
export PATH=$PATH:/Users/matic/.spicetify
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
# A simple vim plugin for zsh
export VI_MODE_ESC_INSERT="jk" && plug "zap-zsh/vim"

# export NVIM_APPNAME="nvim-AstroNvim"
export NVIM_APPNAME="AstroNvim"

#export PATH="$PATH:./node_modules/.bin"
eval "$(fnm env)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
# eval "`pip completion --zsh`"

# default nvim
export NVIM_APPNAME="nvim"

export PATH=$PATH:/Library/Frameworks/Python.framework/Versions/3.12/bin

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
