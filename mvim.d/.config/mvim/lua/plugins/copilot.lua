return {
	{
		"zbirenbaum/copilot.lua",
		event = { "BufEnter" },
		config = function()
			require("nvim.mainm.config.nvim.lua.user.copilot").setup({
				suggestion = {
					enabled = false,
				},
				panel = { enabled = false },
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		event = { "BufEnter" },
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
