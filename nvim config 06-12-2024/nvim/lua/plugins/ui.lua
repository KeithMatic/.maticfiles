local M = {
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },

  	-- lspsaga.nvim
	{
		"nvimdev/lspsaga.nvim",
		event = "BufRead",
		dependencies = {
			"nvim-treesitter/nvim-treesitter", -- optional
			"nvim-tree/nvim-web-devicons", -- optional
        },
    opts = {}
	},

  	-- smoothcursor.nvim
	{
		"gen740/smoothcursor.nvim",
		cond = vim.g.neovide == nil,
		lazy = false,
		opts = {
			autostart = true,
			fancy = { enable = true },
		},
	},
}

return M