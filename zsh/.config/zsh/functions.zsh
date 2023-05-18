function take() {
  local dir_name="$1"
  mkdir -p "$dir_name" && cd "$dir_name"
}

# function mkcd() {
#   mkdir -p "$1" && cd "$1"
# }