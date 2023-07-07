#!/bin/sh
# Fig pre block. Keep at the top of this file.
# [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Neofetch
# neofetch

# Macchina
macchina

# history
HISTFILE=~/.zsh_history

# source
# plug "${XDG_DATA_HOME:-$HOME/.config}/zsh/aliases.zsh"
# plug "${XDG_DATA_HOME:-$HOME/.config}/zsh/exports.zsh"
# plug "${XDG_DATA_HOME:-$HOME/.config}/zsh/omp.zsh"
plug "$HOME/.config/zsh/functions.zsh"
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/omp.zsh"
plug "$HOME/.config/zsh/nvims.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Home Path
export PATH='$HOME/.local/bin':$PATH

# plugins

# === prompts ===
plug "zap-zsh/zap-prompt"
# plug "wintermi/zsh-starship"
# plug "MAHcodes/distro-prompt"

# plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "wintermi/zsh-rust"
plug "Aloxaf/fzf-tab"
plug "zap-zsh/vim"
plug "zap-zsh/fzf"
plug "wintermi/zsh-brew"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
plug "wintermi/zsh-fnm"
plug "olets/zsh-abbr" # abbr like fish
# plug "chivalryq/git-alias"
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
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"


# Source the Lazyman shell initialization for aliases and nvims selector
# shellcheck source=.config/nvim-Lazyman/.lazymanrc
[ -f ~/.config/nvim-Lazyman/.lazymanrc ] && source ~/.config/nvim-Lazyman/.lazymanrc
# Source the Lazyman .nvimsbind for nvims key binding
# shellcheck source=.config/nvim-Lazyman/.nvimsbind
[ -f ~/.config/nvim-Lazyman/.nvimsbind ] && source ~/.config/nvim-Lazyman/.nvimsbind

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/matic/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/matic/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/matic/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/matic/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

