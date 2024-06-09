#!/bin/sh

# Oh My Posh
# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init zsh)"
# fi

if [ $TERM_PROGRAM != "Apple_Terminal" ]; then
#  eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/jblab_2021.omp.json)"
 eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/matic.toml)"
#  eval "$(oh-my-posh init zsh --config ~/jandedobbeleer.omp.json)"
fi
# Oh-My-Posh themes folder
alias poshThemes='$(brew --prefix oh-my-posh)/themes'

# Setting a theme with Oh-My-Posh
function posh() {
    local theme="$1"
    eval "$(oh-my-posh init zsh --config $(brew --prefix oh-my-posh)/themes/$theme.omp.json)"
}

