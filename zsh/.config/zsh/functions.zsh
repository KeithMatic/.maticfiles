function take() {
  local dir_name="$1"
  mkdir -p "$dir_name" && cd "$dir_name"
}

# function mkcd() {
#   mkdir -p "$1" && cd "$1"
# }
function spicetify_theme() {
  local theme_name="$1"
 spicetify config current_theme $theme_name 
}

function tswindow() {
  local session="$1"
  tmux new -s $1 -n $1
}
