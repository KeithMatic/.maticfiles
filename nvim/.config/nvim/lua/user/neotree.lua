-- TODO

-- references:
-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes

local M = {
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
}

M.config = function()
	require("neo-tree").setup({
		sources = {
			"filesystem",
		},
		add_blank_line_top = true,
		hide_root_node = false,
		retain_hidden_root_indent = false,
		enable_git_status = true,
		close_if_last_window = true,
		popup_border_style = "rounded",
		enable_modified_markers = true,
		enable_diagnostics = true,
		sort_case_insensitive = true,
		source_selector = {
			winbar = true,
			statusline = false,
		},
		default_component_configs = {
			indent = {
				with_markers = true,
				with_expanders = true,
				indent_marker = "╎",
				-- last_indent_marker = "└",
				highlight = "NeoTreeIndentMarker",
				-- expander config, needed for nesting files
				with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
				expander_collapsed = "",
				expander_expanded = "",
				expander_highlight = "NeoTreeExpander",
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
      symlink_target = {
            enabled = true,
          },
		},
    git_status_async = true,
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
          buffers = {
          follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            --              -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
          group_empty_dirs = true, -- when true, empty folders will be grouped together
          show_unloaded = true,
          window = {
            mappings = {
              ["bd"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["."] = "set_root",
              ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            }
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
end

return M
