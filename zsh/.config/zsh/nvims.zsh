#!/bin/sh

alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
# alias nvim-kickstart="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"

function nvima() {
  env NVIM_APPNAME=AstroNvim nvim
}

function nviml() {
  env NVIM_APPNAME=LazyVim nvim
}

function nvimn() {
  env NVIM_APPNAME=NvChad nvim
}

function nvims() {
  items=("default" "AstroNvim" "LazyVim" "NvChad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# bindkey -s ^a "nvims\n"
