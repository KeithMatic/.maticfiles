return {
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = { "BufEnter" },
		config = function()
			-- Turn on LSP, formatting, and linting status and progress information
			require("nvim.mainm.config.nvim.lua.user.fidget").setup({
				text = {
					spinner = "dots_negative",
				},
			})
		end,
	},
}
