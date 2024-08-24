return {
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("nvim.mainm.config.nvim.lua.user.gitsigns").setup()
		end,
	},
}
