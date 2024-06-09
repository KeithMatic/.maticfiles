#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

theme_option="@tmux-themes"
default_theme="tokyonight-night"

get_tmux_option() {
	local option default_value option_value
	option="$1"
	default_value="$2"
	option_value="$(tmux show-option -gqv "$option")"
	if [ -z "$option_value" ]; then
		echo "$default_value"
	else
		echo "$option_value"
	fi
}

main() {
	local theme
	theme="$(get_tmux_option "$theme_option" "$default_theme")"
	tmux source-file "$CURRENT_DIR/themes/${theme}.tmuxtheme"
}

main
