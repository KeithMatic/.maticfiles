return {
	{
		"RRethy/vim-illuminate",
		lazy = true,
		config = function()
			require("nvim.mainm.config.nvim.lua.user.illuminate").configure({
				under_cursor = false,
				filetypes_denylist = {
					"DressingSelect",
					"Outline",
					"TelescopePrompt",
					"alpha",
					"harpoon",
					"toggleterm",
					"neo-tree",
					"Spectre",
					"reason",
				},
			})
		end,
	},
}
