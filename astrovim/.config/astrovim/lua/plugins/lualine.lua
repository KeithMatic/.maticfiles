return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"meuter/lualine-so-fancy.nvim",
		},
		enabled = true,
		lazy = false,
		event = { "BufReadPost", "BufNewFile", "VeryLazy" },

		config = function()
			local icons = require("util.icons")
			local fn, api = vim.fn, vim.api
			-- New color table and conditions
			local colors = {
				bg = "None", -- Ensure this is a valid color or nil
				fg = "#7FC7D9",
				-- fg = "#45657b",
				yellow = "#ecc58d",
				cyan = "#21c7a8",
				darkblue = "#081633",
				green = "#aedb67",
				orange = "#FF8800",
				magenta = "#c792eb",
				blue = "#82aaff",
				red = "#ef5350",
				violet = "#FFCDEA",
				-- violet = "#a9a1e1",
				-- #FFCDEA
			}

			local conditions = {
				buffer_not_empty = function()
					return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
				end,
				hide_in_width = function()
					return vim.fn.winwidth(0) > 80
				end,
				check_git_workspace = function()
					local filepath = vim.fn.expand("%:p:h")
					local gitdir = vim.fn.finddir(".git", filepath .. ";")
					return gitdir and #gitdir > 0 and #gitdir < #filepath
				end,
				has_lsp_clients = function()
					local clients = vim.lsp.get_clients({ bufnr = 0 })
					return #clients > 0
				end,
			}

			-- Configuration for lualine
			local config = {
				options = {
					component_separators = "",
					section_separators = "",
					theme = {
						normal = { c = { fg = colors.fg, bg = colors.bg } },
						inactive = { c = { fg = colors.fg, bg = colors.bg } },
					},
					disabled_filetypes = {
						statusline = {},
					},
				},
				sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {},
					lualine_x = {
						{
							require("noice").api.statusline.mode.get,
							cond = require("noice").api.statusline.mode.has,
							color = { fg = "#ff9e64" },
						},
					},
					lualine_y = {},
					lualine_z = {},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = {},
					lualine_y = {},
					lualine_z = {},
				},
				extensions = { "quickfix", "man", "fugitive" },
			}

			-- Helper functions for inserting components
			local function ins_left(component)
				table.insert(config.sections.lualine_c, component)
			end

			local function ins_right(component)
				table.insert(config.sections.lualine_x, component)
			end

			-- Component definitions
			-- Add the components setup here following the new configuration
			ins_left({
				function()
					return " "
				end,
				color = { fg = colors.bg }, -- Sets highlighting of component
				padding = { left = 0, right = 1 }, -- We don't need space before this
			})

			ins_left({
				-- mode component
				function()
					return ""
				end,
				color = function()
					-- auto change color according to neovims mode
					local mode_color = {
						n = colors.blue,
						i = colors.green,
						v = colors.violet,
						[""] = colors.blue,
						V = colors.blue,
						c = colors.magenta,
						no = colors.red,
						s = colors.orange,
						S = colors.orange,
						[""] = colors.orange,
						ic = colors.yellow,
						R = colors.violet,
						Rv = colors.violet,
						cv = colors.red,
						ce = colors.red,
						r = colors.cyan,
						rm = colors.cyan,
						["r?"] = colors.cyan,
						["!"] = colors.red,
						t = colors.red,
					}
					return { fg = mode_color[vim.fn.mode()] }
				end,
				padding = { right = 1 },
			})
			-- filename
			-- ins_left({
			-- 	-- function()
			-- 		-- return "filename"
			-- 	-- end,
			-- 	"filename",
			-- 	cond = conditions.buffer_not_empty,
			-- 	-- color = { fg = colors.green, gui = "bold" },
			-- 	color = function()
			-- 		-- auto change color according to neovims mode
			-- 		-- fg = colors.green
			-- 		-- gui = "bold"
			-- 		local mode_color = {
			-- 			n = colors.blue,
			-- 			i = colors.green,
			-- 			v = colors.yellow,
			-- 			[""] = colors.blue,
			-- 			V = colors.violet,
			-- 			c = colors.magenta,
			-- 			no = colors.red,
			-- 			s = colors.orange,
			-- 			S = colors.orange,
			-- 			[""] = colors.orange,
			-- 			ic = colors.yellow,
			-- 			R = colors.violet,
			-- 			Rv = colors.violet,
			-- 			cv = colors.red,
			-- 			ce = colors.red,
			-- 			r = colors.cyan,
			-- 			rm = colors.cyan,
			-- 			["r?"] = colors.cyan,
			-- 			["!"] = colors.red,
			-- 			t = colors.red,
			-- 		}
			-- 		return { gui = "bold", fg = mode_color[vim.fn.mode()] }
			-- 	end,
			-- })

			ins_left({
				-- filesize component
				"filesize",
				icon = "󰙴",
				cond = conditions.buffer_not_empty,
			})

			ins_left({
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = icons.misc.error, warn = icons.misc.warn, info = icons.misc.info },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				},
			})

			-- Insert mid section. You can make any number of sections in neovim :)
			-- for lualine it's any number greater then 2

			ins_left({
				function()
					return "%="
				end,
			})

			ins_left({
				-- "fancy_lsp_servers",
				"fancy_diff",
				"progress",
			})

			ins_left({
				function()
					if vim.bo.filetype == "python" then
						local venv = vim.env.VIRTUAL_ENV
						if venv then
							local venv_name = fn.fnamemodify(venv, ":t")
							return string.format("(%s)", venv_name)
						end
					end
					return ""
				end,
				-- icon = function()
				--   local devicons = require("nvim-web-devicons")
				--   local icon, color = devicons.get_icon_color_by_filetype("python")
				--   return { icon, color = { fg = color } }
				-- end,
				icon = { "󰌠", color = { fg = "#ffbc03" } },
				color = { fg = colors.violet },
				cond = conditions.hide_in_width,
			})

			-- Add components to right sections
			lualine_x = {
				-- mason
				require("lazy.status").updates,
				cond = require("lazy.status").has_updates,
				icon = icons.misc.plugin,
				color = { fg = colors.blue, gui = "bold" },
			}
			ins_right({
				"diff",
				-- Is it me or the symbol for modified us really weird
				symbols = { added = " ", modified = " ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.orange },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			})

			-- Location
			ins_right({
				"location",
				function()
					local line = fn.line(".")
					local lines = fn.line("$")
					local col = fn.virtcol(".")
					-- return string.format("%3d/%d:%-2d", line, lines, col)
					return string.format("%d/%d:%d", line, lines, col)
				end,
				icon = { "", color = { fg = colors.violet, gui = "bold" } },
				separator = { left = "", right = "" },
				color = { fg = colors.violet, gui = "bold" },
			})
			-- Progress
			ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })

			ins_right({
				"branch",
				icon = "",
				color = { fg = colors.violet, gui = "bold" },
			})
			-- ins_right {
			--   function()
			--     return '▊'
			--   end,
			--   color = { fg = colors.bg },
			--   padding = { left = 1 },
			-- }
			-- Scrollbar
			ins_right({
				function()
					local current_line = fn.line(".")
					local total_lines = fn.line("$")
					local chars =
						{ "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", "  " }
					local line_ratio = current_line / total_lines
					local index = math.ceil(line_ratio * #chars)
					return chars[index]
				end,
				color = { fg = colors.yellow },
			})
			-- Initialize lualine with the configuration
			require("lualine").setup(config)
		end,
	},
	{
		"rebelot/heirline.nvim",
		optional = true,
		opts = function(_, opts)
			opts.statusline = nil
		end,
	},
}
