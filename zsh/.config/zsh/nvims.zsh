#!/bin/sh

alias nvim-lazy="NVIM_APPNAME=Lazy nvim"
alias nvim-kickstart="NVIM_APPNAME=kickstart nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-nvim="NVIM_APPNAME=mvim nvim"

function as() {
  env NVIM_APPNAME=astrovim nvim
}

function asn() {
  env NVIM_APPNAME=AstroNvim nvim
}

function lv() {
  env NVIM_APPNAME=Lazy nvim
}

function nc() {
  env NVIM_APPNAME=NvChad nvim
}

function ks() {
  env NVIM_APPNAME=kickstart nvim
}

function mvi() {
  env NVIM_APPNAME=mvim nvim
}

function nvims() {
  items=("default" "astrovim" "AstroNvim" "Lazy" "kickstart" "mvim" "NvChad")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

# bindkey -s ^a "nvims\n"
