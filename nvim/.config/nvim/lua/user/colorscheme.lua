local M = {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- make sure to load this before all the other start plugins
	dependencies = {
		"nvim-telescope/telescope.nvim",
		optional = true,
		opts = {
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		},
	},
}

M.config = function()
	---@type CatppuccinOptions
	require("catppuccin").setup({
		flavour = "frappe", -- latte, frappe, macchiato, mocha
		background = { -- :h background
			light = "latte",
			dark = "mocha",
		},
		transparent_background = true, -- disables setting the background color.
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
		styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
			comments = { "italic" }, -- Change the style of comments
			conditionals = { "italic" },
			loops = { "italic" },
			functions = { "italic" },
			keywords = { "italic" },
			strings = {},
			variables = {},
			numbers = {},
			booleans = { "italic" },
			properties = { "italic" },
			types = {},
			operators = {},
			-- miscs = {}, -- Uncomment to turn off hard-coded styles
		},
		color_overrides = {},
		custom_highlights = {},
		default_integrations = true,
		integrations = {
			aerial = true,
			alpha = true,
			cmp = true,
			dap = true,
			noice = true,
			dap_ui = true,
			gitsigns = true,
			illuminate = true,
			indent_blankline = true,
			markdown = true,
			mason = true,
			native_lsp = { enabled = true },
			neotree = true,
			notify = true,
			semantic_tokens = true,
			symbols_outline = true,
			telescope = true,
			treesitter = true,
			ts_rainbow = false,
			ufo = true,
			which_key = true,
			window_picker = true,
			nvimtree = true,
			mini = {
				enabled = true,
				indentscope_color = "",
			},
		},
	})

	-- Setup catppuccin
	vim.cmd.colorscheme("catppuccin")
	vim.cmd([[colorscheme catppuccin]])
end

return M
