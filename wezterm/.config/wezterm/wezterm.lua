-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- CTRL + SHIFT + ARROW = switch panes
-- local keys = {}
--
-- for i = 1, 8 do
-- 	-- CTRL+ALT + number to activate that tab
-- 	table.insert(keys, {
-- 		key = tostring(i),
-- 		mods = "ALT",
-- 		action = act({ ActivateTab = i - 1 }),
-- 	})
-- end
--
-- table.insert(keys, { key = "n", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDown" }) })
-- colors.metadata = wezterm.color.load_scheme("wezterm/assets/colors/tokyonight_moon.toml")
-- config.color_scheme = "Catppuccin Macchiato"
config.color_scheme = "tokyonight_moon"

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 13
config.window_background_image = "none"
config.window_background_image_hsb = {
	brightness = 0.0,
	hue = 1.0,
	saturation = 1.0,
}

config.window_padding = {
	left = 1,
	right = -5,
	top = 2,
	bottom = 0,
}

config.text_background_opacity = 1

-- wezterm.font('OperatorMonoSSmLig Nerd Font', { weight =370, italic = true })
config.font = wezterm.font_with_fallback({
	{
		family = "Operator Mono SSm Lig",
		-- family = "Cascadia Code PL",
		weight = 380,
		scale = 1,
	},
	-- { family = "Cascadia Code", weight = 550, scale = 1 },
	{ family = "Symbols Nerd Font Mono", scale = 0.90, italic = false },
	-- { family = "Symbols" },
	-- { family = "Operator Mono", weight = 380, scale = 1, italic = true },
})
config.use_cap_height_to_scale_fallback_fonts = true
config.line_height = 1.4

config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.scrollback_lines = 3500

-- and finally, return the configuration to wezterm
return config
