-- return {
-- 	{
-- 		"nvim-treesitter/nvim-treesitter",
-- 		opts = function(_, opts)
-- 			if opts.ensure_installed ~= "all" then
-- 				opts.ensure_installed = require("astrocore").list_insert_unique(
-- 					opts.ensure_installed,
-- 					{ "bash", "markdown", "markdown_inline", "regex", "vim" }
-- 				)
-- 			end
-- 		end,
-- 	},
-- 	{
-- 		"AstroNvim/astrolsp",
-- 		optional = true,
-- 		---@param opts AstroLSPOpts
-- 		opts = function(_, opts)
-- 			local noice_opts = require("astrocore").plugin_opts("noice.nvim")
-- 			-- disable the necessary handlers in AstroLSP
-- 			if not opts.lsp_handlers then
-- 				opts.lsp_handlers = {}
-- 			end
-- 			if vim.tbl_get(noice_opts, "lsp", "hover", "enabled") ~= false then
-- 				opts.lsp_handlers["textDocument/hover"] = false
-- 			end
-- 			if vim.tbl_get(noice_opts, "lsp", "signature", "enabled") ~= false then
-- 				opts.lsp_handlers["textDocument/signatureHelp"] = true
-- 			end
-- 		end,
-- 	},
-- 	{
-- 		"heirline.nvim",
-- 		optional = true,
-- 		opts = function(_, opts)
-- 			local noice_opts = require("astrocore").plugin_opts("noice.nvim")
-- 			if vim.tbl_get(noice_opts, "lsp", "progress", "enabled") ~= false then -- check if lsp progress is enabled
-- 				-- opts.statusline[9] = require("astroui.status").component.lsp({ lsp_progress = false })
-- 			end
-- 		end,
-- 	},
-- 	{
-- 		"folke/noice.nvim",
-- 		event = "VeryLazy",
-- 		dependencies = { "MunifTanjim/nui.nvim" },
-- 		opts = function(_, opts)
-- 			local utils = require("astrocore")
-- 			return utils.extend_tbl(opts, {
-- 				views = {
-- 					cmdline_popup = {
-- 						position = {
-- 							row = 20,
-- 							col = "50%",
-- 						},
-- 						size = {
-- 							width = 60,
-- 							height = "auto",
-- 						},
-- 					},
-- 					popupmenu = {
-- 						relative = "editor",
-- 						position = {
-- 							row = 8,
-- 							col = "50%",
-- 						},
-- 						size = {
-- 							width = 60,
-- 							height = 10,
-- 						},
-- 						border = {
-- 							style = "rounded",
-- 							padding = { 0, 1 },
-- 						},
-- 						win_options = {
-- 							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
-- 						},
-- 					},
-- 				},
-- 				routes = {
-- 					{
-- 						filter = {
-- 							event = "msg_show",
-- 							kind = "",
-- 							find = "written",
-- 						},
-- 						opts = { skip = true },
-- 					},
-- 				},
-- 				-- routes = {
-- 				--   {
-- 				--     view = "notify",
-- 				--     filter = { event = "msg_showmode" },
-- 				--   },
-- 				-- },
-- 				lsp = {
-- 					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
-- 					override = {
-- 						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
-- 						["vim.lsp.util.stylize_markdown"] = true,
-- 						["cmp.entry.get_documentation"] = true,
-- 						["config.lsp.signature.enabled"] = false,
-- 					},
--           signature = {
--             enabled = false,
--           },
--           hover = {
--             enabled = false,
--           },
-- 				},
-- 				presets = {
-- 					bottom_search = true, -- use a classic bottom cmdline for search
-- 					command_palette = true, -- position the cmdline and popupmenu together
-- 					long_message_to_split = true, -- long messages will be sent to a split
-- 					inc_rename = utils.is_available("inc-rename.nvim"), -- enables an input dialog for inc-rename.nvim
-- 					lsp_doc_border = false, -- add a border to hover docs and signature help
-- 				},
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"folke/edgy.nvim",
-- 		optional = true,
-- 		opts = function(_, opts)
-- 			if not opts.bottom then
-- 				opts.bottom = {}
-- 			end
-- 			table.insert(opts.bottom, {
-- 				ft = "noice",
-- 				size = { height = 0.4 },
-- 				filter = function(_, win)
-- 					return vim.api.nvim_win_get_config(win).relative == ""
-- 				end,
-- 			})
-- 		end,
-- 	},
-- 	{
-- 		"catppuccin",
-- 		optional = true,
-- 		---@type CatppuccinOptions
-- 		opts = { integrations = { noice = true } },
-- 	},
-- }

return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = true,
	opts = {
		-- add any options here
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		-- "rcarriga/nvim-notify",
	},

	config = function()
		require("nvim.mainm.config.nvim.lua.user.noice").setup({
			views = {
				cmdline_popup = {
					position = {
						row = 20,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 8,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},
			-- routes = {
			--   {
			--     view = "notify",
			--     filter = { event = "msg_showmode" },
			--   },
			-- },
			lsp = {
				Progress = {
					enabled = true,
					-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
					-- See the section on formatting for more details on how to customize.
					--- @type NoiceFormat|string
					format = "lsp_progress",
					--- @type NoiceFormat|string
					format_done = "lsp_progress_done",
					throttle = 1000 / 30, -- frequency to update lsp progress message
					view = "mini",
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- you can enable a preset for easier configuration
			-- presets = {
			--     bottom_search = true,         -- use a classic bottom cmdline for search
			--     command_palette = true,       -- position the cmdline and popupmenu together
			--     long_message_to_split = true, -- long messages will be sent to a split
			--     inc_rename = false,           -- enables an input dialog for inc-rename.nvim
			--     lsp_doc_border = true,        -- add a border to hover docs and signature help
			-- },
			-- cmdline = {
			-- 	view = "cmdline",
			-- },
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		})
	end,
}
