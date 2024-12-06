local M = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		{ "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	},
}

function M.config()
	local keymap = vim.keymap.set
	local opts = { noremap = true, silent = true }

	keymap("n", "<s-m>", "<cmd>lua require('harpoon.').mark_file()<cr>", opts)
	keymap("n", "<TAB>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
	-- Harpoon keybinds --
	-- Open harpoon ui
	keymap("n", "<leader>ho", function()
		require("harpoon.ui").toggle_quick_menu()
	end, { desc = "Open Harpoon UI" })

	-- Add current file to harpoon
	keymap("n", "<leader>ha", function()
		require("harpoon.mark").add_file()
	end, { desc = "Harpoon Add File" })

	-- Remove current file from harpoon
	keymap("n", "<leader>hr", function()
		require("harpoon.mark").rm_file()
	end, { desc = "Harpoon Remove File" })

	-- Remove all files from harpoon
	keymap("n", "<leader>hc", function()
		require("harpoon.mark").clear_all()
	end, { desc = "Harpoon Clear All" })

	-- Quickly jump to harpooned files
	keymap("n", "<leader>1", function()
		require("harpoon.ui").nav_file(1)
	end, { desc = "Harpooned File 1" })

	keymap("n", "<leader>2", function()
		require("harpoon.ui").nav_file(2)
	end, { desc = "Harpooned File 2" })

	keymap("n", "<leader>3", function()
		require("harpoon.ui").nav_file(3)
	end, { desc = "Harpooned File 3" })

	keymap("n", "<leader>4", function()
		require("harpoon.ui").nav_file(4)
	end, { desc = "Harpooned File 4" })

	keymap("n", "<leader>5", function()
		require("harpoon.ui").nav_file(5)
	end, { desc = "Harpooned File 5" })
end

function M.mark_file()
	require("harpoon.mark").add_file()
	vim.notify("󱡅  marked file")
end

return M
