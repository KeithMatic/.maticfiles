local M = {
  audible_bell = "Disabled",

  font_size = 15,

  max_fps = 60,
  animation_fps = 60,
  front_end = "WebGpu",

  -- cursor
  default_cursor_style = "SteadyBar",

  -- window
  window_background_opacity = 0.82,
  macos_window_background_blur = 20,
  window_decorations = "RESIZE",
  window_padding = { left = 0, right = 0, top = 0, bottom = 0 },

  -- tab
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,
  show_new_tab_button_in_tab_bar = false,

  check_for_updates = false,
}

return M
