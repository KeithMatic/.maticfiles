local M = {}

local fn, api = vim.fn, vim.api

local icons = require("util.icons")

-- New color table and conditions
local palette = {
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
  pink = "#FFCDEA",
  lavender = "#C8ACD6",
	-- violet = "#a9a1e1",
	-- #FFCDEA
}

M.plugins = {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"meuter/lualine-so-fancy.nvim",
	},
	enabled = true,
	lazy = false,
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
}

M.conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.o.columns > 100
	end,
	has_lsp_clients = function()
		local clients = vim.lsp.get_clients({ bufnr = 0 })
		return #clients > 0
	end,
	check_git_workspace = function()
		local filepath = vim.fn.expand("%:p:h")
		local gitdir = vim.fn.finddir(".git", filepath .. ";")
		return gitdir and #gitdir > 0 and #gitdir < #filepath
	end,
}

M.components = {
	mode = {
		-- "mode",
		"",
		fmt = function(str)
			return string.sub(str, 1, 1)
		end,
		separator = {
			-- right = "",
			-- left = "",
		},
	},

	branch = {
		"branch",
		icon = { "", color = { fg = palette.pink, gui = "bold" } },
		color = { gui = "bold" },
		separator = {
			right = "",
		},
	},

	filetype = {
		"filetype",
		icon_only = true,
	},

	filename = {
		"filename",
		file_status = false,
		color = { fg = palette.lavender },
	},

	filesize = {
		"filesize",
		icon = "󰙴",
		color = { fg = palette.lavender },
		padding = { left = 1, right = 1 },
		cond = M.conditions.buffer_not_empty and M.conditions.hide_in_width,
	},

	diagnostics = {
		"diagnostics",
		sources = { "nvim_diagnostic" },
		sections = { "error", "warn", "info", "hint" },
		symbols = icons.diagnostics,
		cond = M.conditions.hide_in_width,
	},

	diff = {
		"diff",
		source = function()
			---@diagnostic disable-next-line: undefined-field
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end,
		symbols = {
			added = " ",
			modified = " ",
			removed = " ",
		},
		cond = M.conditions.hide_in_width,
	},

	treesitter = {
		function()
			return ""
		end,
		color = function()
			local buf = api.nvim_get_current_buf()
			local ts = vim.treesitter.highlighter.active[buf]
			return {
				fg = ts and not vim.tbl_isempty(ts) and palette.green or palette.red,
			}
		end,
		cond = M.conditions.hide_in_width,
	},

	python_env = {
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
		color = { fg = palette.lavender },
		cond = M.conditions.hide_in_width,
	},

	lsp = {
		function()
			local clients = {}
			local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
			for _, client in pairs(buf_clients) do
				table.insert(clients, client.name)
			end

			return string.format("LSP(s):[%s]", table.concat(clients, " • "))
		end,
		icon = "",
		color = { fg = palette.mauve },
		cond = M.conditions.hide_in_width and M.conditions.has_lsp_clients,
	},

	dap = {
		function()
			return require("dap").status()
		end,
		icon = "",
		color = { fg = palette.yellow },
		cond = function()
			return package.loaded["dap"] and require("dap").status() ~= ""
		end,
	},

	lazy = {
		require("lazy.status").updates,
		color = { fg = palette.subtext0 },
		cond = require("lazy.status").has_updates,
	},

	location = {
		function()
			local line = fn.line(".")
			local lines = fn.line("$")
			local col = fn.virtcol(".")
			-- return string.format("%3d/%d:%-2d", line, lines, col)
			return string.format("%d/%d:%d", line, lines, col)
		end,
		icon = { "", color = { fg = palette.pink, gui = "bold" } },
		separator = { left = "" },
		color = { gui = "bold" },
	},

	scrollbar = {
		function()
			local current_line = fn.line(".")
			local total_lines = fn.line("$")
			local chars = { "██", "▇▇", "▆▆", "▅▅", "▄▄", "▃▃", "▂▂", "▁▁", "  " }
			local line_ratio = current_line / total_lines
			local index = math.ceil(line_ratio * #chars)
			return chars[index]
		end,
		color = { fg = palette.yellow },
	},

	spaces = {
		function()
			if not api.nvim_get_option_value("expandtab", { buf = 0 }) then
				return "Tab:" .. api.nvim_get_option_value("tabstop", { buf = 0 })
			end
			local size = api.nvim_get_option_value("shiftwidth", { buf = 0 })
			if size == 0 then
				size = api.nvim_get_option_value("tabstop", { buf = 0 })
			end
			return "Spaces:" .. size
		end,
		padding = { left = 1, right = 1 },
		cond = M.conditions.hide_in_width,
		color = { fg = palette.red },
	},

	clock = {
		function()
			return os.date("%R")
		end,
		icon = "",
		separator = {
			right = "",
			left = "",
		},
	},
}

return M