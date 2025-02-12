# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

#!/bin/sh

eval $(/opt/homebrew/bin/brew shellenv)

# Set Zinit path
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# Check if Zinit is installed
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
# source "${ZINIT_HOME}/zinit.zsh"
source "${ZINIT_HOME}/zinit.zsh"

multisrc() {
  local file
  for file do
    if [ -r "$file" ]; then
      source "$file"
    else
      echo "Error: $file not found or not readable" >&2
    fi
  done
}

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

# zinit ice depth=1; zinit light romkatv/powerlevel10k

# Load and initialise completion system
autoload -Uz compinit && compinit

# zinit cdreplay -q
zinit cdreplay -q

# key bindings
bindkey -e # tmux mode or '^ ' autosuggest-accept
bindkey '^p ' history-substring-search-up # history substring search up
bindkey '^n ' history-substring-search-down # history substring search down
bindkey '^p ' history-search-backward # history search up
bindkey '^n ' history-search-forward # history search down

# Completion styling
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' verbose true
zstyle ':completion:*' menu no
zstyle ':completion:*' list-colors '${(s.:.)LS_COLORS}'
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color=always $realpath'

# Snippets
# zinit ice wait
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found
zinit ice as"program" pick"bin/git-dsf"

# Neofetch
# neofetch

# Macchina
macchina

# Source files
multisrc $HOME/.config/zsh/functions.zsh $HOME/.config/zsh/aliases.zsh $HOME/.config/zsh/omp.zsh $HOME/.config/zsh/nvims.zsh $HOME/.config/zsh/exports.zsh

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Home Path
export PATH='$HOME/.local/bin':$PATH

# plugins

# === prompts ===
zinit light "zap-zsh/zap-prompt"
zinit ice wait lucid
# plug "wintermi/zsh-starship"
# plug "MAHcodes/distro-prompt"

# === completions ===
zinit ice wait lucid
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light Aloxaf/fzf-tab

zinit light zdharma-continuum/zsh-diff-so-fancy
zinit light esc/conda-zsh-completion
zinit light hlissner/zsh-autopair
zinit light zap-zsh/supercharge
zinit light wintermi/zsh-rust
zinit light zap-zsh/vim
zinit light zap-zsh/fzf
zinit light wintermi/zsh-brew
zinit light zap-zsh/exa
zinit light zsh-users/zsh-syntax-highlighting
zinit light wintermi/zsh-fnm
zinit light olets/zsh-abbr # abbr like fish
zinit light chivalryq/git-alias
zinit light djui/alias-tips # alias tips

# autojump path
# alias autojumpdb ='$HOME/Library/autojump/autojump.txt'
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# keybinds
# bindkey '^ ' autosuggest-accept

if command -v bat &> /dev/null; then
  alias cat="bat -pp --theme \"Visual Studio Dark+\"" 
  alias catt="bat --theme \"Visual Studio Dark+\""
fi

# Fig post block. Keep at the bottom of this file.
# 
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


# bun completions
[ -s "/Users/matic/.bun/_bun" ] && source "/Users/matic/.bun/_bun"


# CodeWhisperer post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/codewhisperer/shell/zshrc.post.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"

# pnpm
export PNPM_HOME="/Users/matic/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
