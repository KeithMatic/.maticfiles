require("nvim.mainm.config.nvim.lua.user.lazy").setup({
	{
		"AstroNvim/AstroNvim",
		version = "^4", -- Remove version tracking to elect for nighly AstroNvim
		import = "astronvim.plugins",
		opts = { -- AstroNvim options must be set here with the `import` key
			mapleader = " ", -- This ensures the leader key must be configured before Lazy is set up
			maplocalleader = ",", -- This ensures the localleader key must be configured before Lazy is set up
			icons_enabled = true, -- Set to false to disable icons (if no Nerd Font is available)
			pin_plugins = nil, -- Default will pin plugins when tracking `version` of AstroNvim, set to true/false to override
			update_notifications = true, -- Enable/disable notification about running `:Lazy update` twice to update pinned plugins
		},
	},
	{ import = "community" },
	{ import = "plugins" },
} --[[@as LazySpec]], {
	-- Configure any other `lazy.nvim` configuration options here
	defaults = { lazy = true },
	install = { colorscheme = { "catppuccin" } },
	ui = {
		-- backdrop = M.transparent and 100 or 60,
		backdrop = 100 or 60,
		-- border = M.get_border(),
		icons = {
			loaded = "󰽢",
			not_loaded = "󰏝",
			plugin = "",
		},
	},
	performance = {
		rtp = {
			-- disable some rtp plugins, add more to your liking
			disabled_plugins = {
				"gzip",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"zipPlugin",
				"getscript",
				"getscriptPlugin",
				"logipat",
				"netrw",
				"netrwPlugin",
				"netrwSettings",
				"netrwFileHandlers",
				"matchit",
				"tar",
				"rrhelper",
				"spellfile_plugin",
				"vimball",
				"vimballPlugin",
				"zip",
				"tutor",
				"rplugin",
				"syntax",
				"synmenu",
				"optwin",
				"compiler",
				"bugreport",
			},
		},
	},
} --[[@as LazyConfig]])
