-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.color_scheme = 'Catppuccin Macchiato'

config.window_decorations = "RESIZE"
config.window_close_confirmation = 'NeverPrompt'
config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

config.window_padding = {
  left = 0,
  right = 0,
  top = 3,
  bottom = 0,
}

config.text_background_opacity = 1

-- wezterm.font('OperatorMonoSSmLig Nerd Font', { weight =370, italic = true })
config.font = wezterm.font_with_fallback ({
  { family = "OperatorMonoSSmLig Nerd Font", weight =380 },
})
config.use_cap_height_to_scale_fallback_fonts = true
config.line_height = 1.0

config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.scrollback_lines = 3500

-- and finally, return the configuration to wezterm
return config
