local colors = {
	RainbowDelimiterRed = "#E06C75",
	RainbowDelimiterYellow = "#E5C07B",
	RainbowDelimiterBlue = "#61AFEF",
	RainbowDelimiterOrange = "#D19A66",
	RainbowDelimiterGreen = "#98C379",
	RainbowDelimiterViolet = "#C678DD",
	RainbowDelimiterCyan = "#56B6C2",
}
local M = {
	-- Comment.nvim
	{
		"numToStr/Comment.nvim",
		keys = {
			{ "<leader>/", mode = { "n", "v" }, desc = "Linewise comment" },
			{ "gb", mode = { "n", "v" }, desc = "Blockwise comment" },
		},
		dependencies = {
			{
				"JoosepAlviste/nvim-ts-context-commentstring",
				opts = { enable_autocmd = false },
			},
		},
		opts = function()
			local ok, tcs = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
			return {
				ignore = "^$",
				pre_hook = ok and tcs and tcs.create_pre_hook() or nil,
			}
		end,
	},
	-- nvim-ts-autotag
	{
		"windwp/nvim-ts-autotag",
		ft = {
			"vue",
			"tsx",
			"jsx",
			"html",
			"javascript",
			"typescript",
			"javascriptreact",
			"typescriptreact",
		},
		opts = {},
	},
	-- nvim-autopairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = { map = "<M-e>" },
		},
		config = function(_, opts)
			local autopairs = require("nvim-autopairs")
			local Rule = require("nvim-autopairs.rule")
			local cond = require("nvim-autopairs.conds")

			autopairs.setup(opts)
			autopairs.add_rules({
				Rule("<", ">", "rust"):with_pair(cond.before_regex("%a+")):with_move(function(args)
					return args.char == ">"
				end),
			})
		end,
	},
	-- nvim-treesitter-context
	{
		"nvim-treesitter/nvim-treesitter-context",
		event = { "BufReadPost", "BufNewFile" },
		opts = { mode = "cursor", max_lines = 3 },
	},
	-- rainbow-delimiters.nvim
	{
		{
			"HiPhish/rainbow-delimiters.nvim",
			dependencies = "nvim-treesitter/nvim-treesitter",
			event = { "BufReadPost", "BufNewFile" },
			-- main = "rainbow-delimiters.setup",
			opts = {
				highlight = {
					colors.RainbowDelimiterBlue,
					colors.RainbowDelimiterCyan,
					colors.RainbowDelimiterGreen,
					colors.RainbowDelimiterOrange,
					colors.RainbowDelimiterRed,
					colors.RainbowDelimiterViolet,
					colors.RainbowDelimiterYellow,
					-- 'RainbowDelimiterRed',
					-- 'RainbowDelimiterYellow',
					-- 'RainbowDelimiterBlue',
					-- 'RainbowDelimiterOrange',
					-- 'RainbowDelimiterGreen',
					-- 'RainbowDelimiterViolet',
					-- 'RainbowDelimiterCyan',
				},
				blacklist = { "c", "cpp" },
			},
    },
			{
				"catppuccin",
				optional = true,
				---@type CatppuccinOptions
				opts = { integrations = { rainbow_delimiters = true } },
			},
	},
	-- nvim-surround
	{
		"kylechui/nvim-surround",
		keys = {
			{ "ys", desc = "Add surround" },
			{ "ds", desc = "Delete surround" },
			{ "cs", desc = "Replace surround" },
		},
		opts = { move_cursor = false },
	},

	-- Better text-objects
	{
		"echasnovski/mini.ai",
		event = "VeryLazy",
		opts = function()
			local ai = require("mini.ai")
			return {
				n_lines = 500,
				custom_textobjects = {
					o = ai.gen_spec.treesitter({ -- code block
						a = { "@block.outer", "@conditional.outer", "@loop.outer" },
						i = { "@block.inner", "@conditional.inner", "@loop.inner" },
					}),
					f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
					c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
					t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
					e = { -- Word with case
						{
							"%u[%l%d]+%f[^%l%d]",
							"%f[%S][%l%d]+%f[^%l%d]",
							"%f[%P][%l%d]+%f[^%l%d]",
							"^[%l%d]+%f[^%l%d]",
						},
						"^().*()$",
					},
				},
			}
		end,
	},
	-- mini.bufremove
	{
		"echasnovski/mini.bufremove",
		keys = {
			{
				"<leader>bd",
				function()
					require("mini.bufremove").delete(0)
				end,
				desc = "Delete Buffer",
			},
		},
	},
	-- to-do-comments.nvim
	{
		"folke/todo-comments.nvim",
		cmd = { "TodoTrouble", "TodoTelescope" },
		event = { "BufReadPost" },
    -- stylua: ignore
    keys = {
      { "<leader>fT", "<Cmd>TodoTelescope<CR>", desc = "Find TODOs" },
      { "[T", function() require("todo-comments").jump_prev() end, desc = "Prev TODO comment" },
      { "]T", function() require("todo-comments").jump_next() end, desc = "Next TODO comment" },
    },
		opts = function()
			local palette = require("mvim.config").palette
			return {
				keywords = {
					FIX = { icon = "", color = "fix", alt = { "FIXME", "FIXIT", "ISSUE" } },
					TODO = { icon = "", color = "todo" },
					HACK = { icon = "", color = "hack" },
					WARN = { icon = "", color = "warn", alt = { "WARNING", "XXX" } },
					PERF = { icon = "", color = "perf", alt = { "OPTIM" } },
					NOTE = { icon = "", color = "note" },
					TEST = { icon = "", color = "test", alt = { "PASSED", "FAILED" } },
				},
				highlight = {
					before = "",
					keyword = "wide_fg",
					after = "",
				},
				colors = {
					fix = { palette.red },
					todo = { palette.green },
					hack = { palette.peach },
					warn = { palette.yellow },
					perf = { palette.mauve },
					note = { palette.blue },
					test = { palette.sky },
				},
			}
		end,
	},

	{
		"folke/flash.nvim",
    -- stylua: ignore
    keys = {
      { "f", mode = { "n", "x", "o" } },
      { "F", mode = { "n", "x", "o" } },
      { "t", mode = { "n", "x", "o" } },
      { "T", mode = { "n", "x", "o" } },
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    },
		opts = {
			jump = {
				pos = "end",
				offset = 1,
			},
			modes = {
				char = {
					-- autohide = true,
					jump_labels = function(motion)
						-- never show jump labels by default
						-- return false
						-- Always show jump labels for ftFT
						return vim.v.count == 0 and motion:find("[ftFT]")
						-- Show jump labels for ftFT in operator-pending mode
						-- return vim.v.count == 0 and motion:find("[ftFT]") and vim.fn.mode(true):find("o")
					end,
					jump = {
						autojump = true,
					},
				},
			},
			prompt = {
				enabled = true,
				prefix = { { " 󰉂 ", "FlashPromptIcon" } },
			},
		},
	},
}

return M
