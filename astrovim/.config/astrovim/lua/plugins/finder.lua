local finder = require("nvim.mainm.config.nvim.lua.user.util.init").finder
-- local noice = require("telescope.extensions.noice")
-- local harpoon = require("telescope").load_extension("harpoon")

local M = {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
  -- stylua: ignore
  keys = {
    { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find files" },
    { "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "Grep (root dir)" },
    { "<leader>fw", "<Cmd>Telescope grep_string<CR>", desc = "Find word" },
    { "<leader>fr", "<Cmd>Telescope oldfiles<CR>", desc = "Recent files" },
    { "<leader>fc", "<Cmd>Telescope current_buffer_fuzzy_find<CR>", desc = "Fuzzy search" },
    { "<leader>fb", "<Cmd>Telescope buffers sort_mru=true sort_lastused=true<CR>", desc = "List buffers" },
    { "<leader>fd", "<Cmd>Telescope diagnostics<CR>", desc = "List diagnostics" },
    { "<leader>fs", finder.lsp_symbols("document"), desc = "Goto symbol" },
    { "<leader>fS", finder.lsp_symbols("workspace"), desc = "Goto symbol (Workspace)" },
    { "<leader>fn", finder.config_files(), desc = "Neovim config files" },
    { "<leader>fR", "<Cmd>Telescope resume<CR>", desc = "Resume" },
    { "<leader>fl", "<Cmd>Telescope resume<CR>", desc = "Resume Last Search" },
    { "<leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Help" },
  },
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("nvim.mainm.config.nvim.lua.user.util.init").on_load("telescope.nvim", function()
					require("nvim.mainm.config.nvim.lua.user.telescope").load_extension("fzf")
				end)
			end,
		},

		{
			"tsakirist/telescope-lazy.nvim",
			config = function()
				require("nvim.mainm.config.nvim.lua.user.util.init").on_load("telescope.nvim", function()
					require("nvim.mainm.config.nvim.lua.user.telescope").load_extension("lazy")
				end)
			end,
		},
		{
			"polirritmico/telescope-lazy-plugins.nvim",
			config = function()
				require("nvim.mainm.config.nvim.lua.user.util.init").on_load("telescope.nvim", function()
					require("nvim.mainm.config.nvim.lua.user.telescope").load_extension("lazy_plugins")
				end)
			end,
		},
		{
			"nvim-telescope/telescope-ui-select.nvim",
		},
		{
			"ThePrimeagen/harpoon",
			config = function()
				require("nvim.mainm.config.nvim.lua.user.util.init").on_load("telescope.nvim", function()
					require("nvim.mainm.config.nvim.lua.user.telescope").load_extension("harpoon")
				end)
			end,
		},
	},
	opts = function()
		local actions = require("telescope.actions")
		local layout_actions = require("telescope.actions.layout")

		return {
			defaults = {
				prompt_prefix = " ",
				selection_caret = "󰈺 ",
				initial_mode = "insert",
				layout_config = {
					height = 0.9,
					width = 0.9,
					preview_cutoff = 120,
					horizontal = {
						preview_width = 0.6,
					},
					vertical = {
						preview_height = 0.7,
					},
				},
				path_display = { "smart" },
				color_devicons = true,
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					"--glob=!.git/",
				},

				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-p>"] = actions.cycle_history_prev,
						["<C-n>"] = actions.cycle_history_next,
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,
						["<Esc>"] = actions.close,
						["<CR>"] = actions.select_default,
						["<C-e>"] = layout_actions.toggle_preview,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = { "fd", "--type", "file" },
					hidden = true,
				},
				grep_string = {
					theme = "dropdown",
				},
				live_grep = {
					theme = "dropdown",
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					sort_mru = true,
					sort_lastused = true,
					ignore_current_buffer = true,
					initial_mode = "normal",
					mappings = {
						i = { ["<C-x>"] = actions.delete_buffer, ["<C-d>"] = actions.delete_buffer },
						n = {
							["dd"] = actions.delete_buffer,
						},
					},
				},

				-- added text copied
				lsp_references = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				lsp_definitions = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				lsp_declarations = {
					theme = "dropdown",
					initial_mode = "normal",
				},

				lsp_implementations = {
					theme = "dropdown",
					initial_mode = "normal",
				},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
				-- noice = {
				-- 	layout_config = {
				-- 		height = 0.9,
				-- 		width = 0.9,
				-- 		preview_cutoff = 120,
				-- 		horizontal = {
				-- 			preview_width = 0.6,
				-- 		},
				-- 		vertical = {
				-- 			preview_height = 0.7,
				-- 		},
				-- 	},
				-- 	mappings = {
				-- 		n = {
				-- 			["/"] = "<cmd>Telescope search noice<CR>",
				-- 			noremap = true,
				-- 		},
				-- 	},
				-- },
				harpoon,
				lazy,
				lazy_plugins,
			},
			require("nvim.mainm.config.nvim.lua.user.telescope").load_extension("noice"),
      require("nvim.mainm.config.nvim.lua.user.telescope").load_extension("ui-select")

		}
	end,
}

return M
