-- TODO

-- references:
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes
return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	event = "VeryLazy",
	keys = {
		{ "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
		{ "<leader><tab>", ":Neotree toggle right<CR>", silent = true, desc = "Right File Explorer" },
    { "<leader>o", "<leader>fo", desc = "Explorer NeoTree Focus (cwd)", remap = true },
	},
	config = function()
		require("neo-tree").setup({
			source_selector = {
				winbar = true,
				statusline = false,
			},
			close_if_last_window = true,
			popup_border_style = "rounded",
			enable_git_status = true,
			enable_modified_markers = true,
			enable_diagnostics = true,
			sort_case_insensitive = true,
			default_component_configs = {
				indent = {
					with_markers = true,
					with_expanders = true,
				},
				modified = {
					symbol = " ",
					highlight = "NeoTreeModified",
				},
				icon = {
					folder_closed = "",
					folder_open = "",
					folder_empty = "",
					folder_empty_open = "",
				},
				git_status = {
					symbols = {
						-- Change type
						added = "",
						deleted = "",
						modified = "",
						renamed = "",
						-- Status type
						untracked = "",
						ignored = "",
						unstaged = "",
						staged = "",
						conflict = "",
					},
				},
			},
			window = {
				position = "float",
				width = 35,
				mappings = {
					-- ["<space>"] = "none",
					["Cr"] = "open",
					["<space>"] = false, -- disable space until we figure out which-key disabling
					["[b"] = "prev_source",
					["]b"] = "next_source",
					["o"] = "open",
					["h"] = "close_node",
					["l"] = "open",
				},
			},
			filesystem = {
				use_libuv_file_watcher = true,
				filtered_items = {
          visible = true,
					hide_dotfiles = false,
					hide_gitignored = false,
					hide_by_name = {
						"node_modules",
					},
					never_show = {
						".DS_Store",
						"thumbs.db",
					},
				},
			},
			event_handlers = {
				{
					event = "neo_tree_window_after_open",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
				{
					event = "neo_tree_window_after_close",
					handler = function(args)
						if args.position == "left" or args.position == "right" then
							vim.cmd("wincmd =")
						end
					end,
				},
			},
		})
	end,
}