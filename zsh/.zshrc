#!/bin/sh
# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Neofetch
neofetch

# history
HISTFILE=~/.zsh_history

# source
# plug "${XDG_DATA_HOME:-$HOME/.config}/zsh/aliases.zsh"
# plug "${XDG_DATA_HOME:-$HOME/.config}/zsh/exports.zsh"
# plug "${XDG_DATA_HOME:-$HOME/.config}/zsh/omp.zsh"
plug "$HOME/.config/zsh/functions.zsh"
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"
plug "$HOME/.config/zsh/omp.zsh"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Home Path
export PATH='$HOME/.local/bin':$PATH

# plugins
# plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
plug "zap-zsh/zap-prompt"
plug "zap-zsh/fzf"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"

plug "olets/zsh-abbr" # abbr like fish
plug "djui/alias-tips" # alias tips

# autojump path
# alias autojumpdb ='$HOME/Library/autojump/autojump.txt'
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# pnpm
# set -gx PNPM_HOME "/Users/matic/Library/pnpm"
# set -gx PATH "$PNPM_HOME" $PATH
# pnpm end

# keybinds
bindkey '^ ' autosuggest-accept

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\""
fi

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

