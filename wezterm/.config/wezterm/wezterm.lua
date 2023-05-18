-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Colorscheme
function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end
-- color_scheme = "Catppuccin Mocha", -- or Macchiato, Frappe, Latte
config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance()),

-- set custom color overrides

-- local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
-- custom.background = "#000000"
-- custom.tab_bar.background = "#040404"
-- custom.tab_bar.inactive_tab.bg_color = "#0f0f0f"
-- custom.tab_bar.new_tab.bg_color = "#080808"

-- return {
--   color_schemes = {
--     ["OLEDppuccin"] = custom,
--   },
--   color_scheme = "OLEDppuccin",
-- }


-- This is where you actually apply your config choices
config.window_decorations = "RESIZE",
config.font = wezterm.font_with_fallback (
  'Operator Mono SSm Lig',
  { family = 
  'font-ligature-symbols',  scale = 0.9 }
),
config.use_cap_height_to_scale_fallback_fonts = true,
config.font_size = 16,
config.scrollbakc_lines = 5000,
config.hide_tab_bar_if_only_one_tab = true,

config.window_background_opacity = 1.0,
config.text_background_opacity = 0.3,


-- and finally, return the configuration to wezterm
return config
