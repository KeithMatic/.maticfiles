return {
		"brenoprata10/nvim-highlight-colors",
		event = { "BufReadPost", "BufNewFile", "VeryLazy" },
		cmd = "HighlightColors",
		
		opts = {
			---Render style
			---@usage 'background'|'foreground'|'virtual'
			render = "foreground",

			---Set virtual symbol (requires render to be set to 'virtual')
			virtual_symbol = "", --"■",

			---Highlight named colors, e.g. 'green'
			enable_named_colors = false,

			---Highlight tailwind colors, e.g. 'bg-blue-500'
			enable_tailwind = true,

			---Set custom colors
			---Label must be properly escaped with '%' to adhere to `string.gmatch`
			--- :help string.gmatch
			custom_colors = {
				-- { label = "%-%-theme%-primary%-color", color = "#0f1219" },
				-- { label = "%-%-theme%-secondary%-color", color = "#5a5d64" },
			},
		},
}
