local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		local transparent = require("config").transparent

		require("catppuccin").setup({
			flavour = transparent and "mocha" or "macchiato",
			transparent_background = transparent,
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			no_italic = false, -- Force no italic
			no_bold = false, -- Force no bold
			no_underline = false, -- Force no underline
			styles = {
				keywords = { "bold", "italic" },
				functions = { "italic" },
				comments = { "italic" }, -- Change the style of comments
				conditionals = { "italic" },
				loops = { "italic" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = { "italic" },
				properties = { "italic" },
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			integrations = {
				-- alpha = false,
				neogit = true,
				-- nvimtree = false,
				-- illuminate = false,
				treesitter_context = true,
				rainbow_delimiters = true,
				dropbar = { enabled = false },
				mason = true,
				noice = true,
				notify = true,
				neotest = true,
				which_key = true,
				telescope = { style = transparent and nil or "nvchad" },
				aerial = true,
				alpha = true,
				cmp = true,
				dap = true,
				dap_ui = true,
				gitsigns = true,
				illuminate = true,
				indent_blankline = true,
				markdown = true,
				native_lsp = { enabled = true },
				neotree = true,
				semantic_tokens = true,
				symbols_outline = true,
				treesitter = true,
				ts_rainbow = false,
				ufo = true,
				window_picker = true,
				nvimtree = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
			custom_highlights = function(colors)
				return {
					-- custom
					PanelHeading = {
						fg = colors.lavender,
						bg = transparent and colors.none or colors.crust,
						style = { "bold", "italic" },
					},

					-- treesitter-context
					TreesitterContextLineNumber = transparent and {
						fg = colors.rosewater,
					} or { fg = colors.subtext0, bg = colors.mantle },

					-- lazy.nvim
					LazyH1 = {
						bg = transparent and colors.none or colors.peach,
						fg = transparent and colors.lavender or colors.base,
						style = { "bold" },
					},
					LazyButton = {
						bg = colors.none,
						fg = transparent and colors.overlay0 or colors.subtext0,
					},
					LazyButtonActive = {
						bg = transparent and colors.none or colors.overlay1,
						fg = transparent and colors.lavender or colors.base,
						style = { "bold" },
					},
					LazySpecial = { fg = colors.green },

					CmpItemMenu = { fg = colors.subtext1 },
					MiniIndentscopeSymbol = { fg = colors.overlay0 },

					FloatBorder = {
						fg = transparent and colors.blue or colors.mantle,
						bg = transparent and colors.none or colors.mantle,
					},

					FloatTitle = {
						fg = transparent and colors.lavender or colors.base,
						bg = transparent and colors.none or colors.lavender,
					},
				}
			end,
		})
		vim.cmd.colorscheme("catppuccin")
		local palette = require("catppuccin.palettes").get_palette()
		require("config").filling_pigments(palette)
	end,
}

return M
