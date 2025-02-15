return {
	{
		"lewis6991/gitsigns.nvim",
		lazy = false,
		config = function()
			local icons = require("config.icons")
			require("nvim.mainm.config.nvim.lua.user.gitsigns").setup({
				signs = {
					add = {
						hl = "GitSignsAdd",
						text = icons.ui.BoldLineLeft,
						numhl = "GitSignsAddNr",
						linehl = "GitSignsAddLn",
					},
					change = {
						hl = "GitSignsChange",
						text = icons.ui.BoldLineLeft,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = icons.ui.TriangleShortArrowRight,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = icons.ui.TriangleShortArrowRight,
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = icons.ui.BoldLineLeft,
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				signcolumn = true,
				numhl = false,
				linehl = false,
				word_diff = false,
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				status_formatter = nil,
				update_debounce = 200,
				max_file_length = 40000,
				preview_config = {
					border = "rounded",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = { enable = false },

				on_attach = function(bufnr)
					vim.keymap.set(
						"n",
						"<leader>H",
						require("nvim.mainm.config.nvim.lua.user.gitsigns").preview_hunk,
						{ buffer = bufnr, desc = "Preview git hunk" }
					)

					vim.keymap.set("n", "<leader>hs", require("nvim.mainm.config.nvim.lua.user.gitsigns").stage_hunk)
					vim.keymap.set("n", "<leader>hr", require("nvim.mainm.config.nvim.lua.user.gitsigns").reset_hunk)
					vim.keymap.set("v", "<leader>hs", function()
						require("nvim.mainm.config.nvim.lua.user.gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					vim.keymap.set("v", "<leader>hr", function()
						require("nvim.mainm.config.nvim.lua.user.gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)
					vim.keymap.set("n", "<leader>hS", require("nvim.mainm.config.nvim.lua.user.gitsigns").stage_buffer)
					vim.keymap.set("n", "<leader>hu", require("nvim.mainm.config.nvim.lua.user.gitsigns").undo_stage_hunk)
					vim.keymap.set("n", "<leader>hR", require("nvim.mainm.config.nvim.lua.user.gitsigns").reset_buffer)
					vim.keymap.set("n", "<leader>hp", require("nvim.mainm.config.nvim.lua.user.gitsigns").preview_hunk)
					vim.keymap.set("n", "<leader>hb", function()
						require("nvim.mainm.config.nvim.lua.user.gitsigns").blame_line({ full = true })
					end)
					vim.keymap.set("n", "<leader>tb", require("nvim.mainm.config.nvim.lua.user.gitsigns").toggle_current_line_blame)
					vim.keymap.set("n", "<leader>hd", require("nvim.mainm.config.nvim.lua.user.gitsigns").diffthis)
					vim.keymap.set("n", "<leader>hD", function()
						require("nvim.mainm.config.nvim.lua.user.gitsigns").diffthis("~")
					end)
					vim.keymap.set("n", "<leader>td", require("nvim.mainm.config.nvim.lua.user.gitsigns").toggle_deleted)
				end,
			})
		end,
	},
	{
		"sindrets/diffview.nvim",
		event = "VeryLazy",
		cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
	},
	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- not git, but it's okay
	"mbbill/undotree",
}
