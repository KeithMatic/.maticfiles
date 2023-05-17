`function take() {
  local dir_name="$1"
  mkdir -p "$dir_name" && cd "$dir_name"
}
`