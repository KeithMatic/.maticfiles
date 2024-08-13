-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {
	-- eyeliner.nvim
	{
		"jinh0/eyeliner.nvim",
		enabled = false,
		lazy = false,
		opts = {
			highlight_on_key = true,
			dim = true,
		},
	},
	-- smoothcursor.nvim
	{
		"gen740/smoothcursor.nvim",
		-- cond = vim.g.neovide == nil,
		lazy = false,
		opts = {
			autostart = true,
			fancy = { enable = true },
		},
	},
	-- precognition
	{
		"tris203/precognition.nvim",
		--event = "VeryLazy",
		config = {
			-- startVisible = true,
			-- showBlankVirtLine = true,
			-- highlightColor = { link = "Comment" },
			-- hints = {
			--      Caret = { text = "^", prio = 2 },
			--      Dollar = { text = "$", prio = 1 },
			--      MatchingPair = { text = "%", prio = 5 },
			--      Zero = { text = "0", prio = 1 },
			--      w = { text = "w", prio = 10 },
			--      b = { text = "b", prio = 9 },
			--      e = { text = "e", prio = 8 },
			--      W = { text = "W", prio = 7 },
			--      B = { text = "B", prio = 6 },
			--      E = { text = "E", prio = 5 },
			-- },
			-- gutterHints = {
			--     G = { text = "G", prio = 10 },
			--     gg = { text = "gg", prio = 9 },
			--     PrevParagraph = { text = "{", prio = 8 },
			--     NextParagraph = { text = "}", prio = 8 },
			-- },
		},
	},

	-- nvim-ufo
	{
		"kevinhwang91/nvim-ufo",
		-- enabled = false,
		event = "BufReadPost",
		dependencies = { "kevinhwang91/promise-async" },
    -- stylua: ignore
    keys = {
      { "zR", function() 	require("ufo").openAllFolds()
end, desc = "Open all folds" },
      { "zM", function() 	require("ufo").closeAllFolds()
end, desc = "Close all folds" },
      { "zP", function() 	require("ufo").peekFoldedLinesUnderCursor()
end, desc = "Preview fold" },
    },
		opts = {
			open_fold_hl_timeout = 0,
			enable_get_fold_virt_text = true,
			preview = {
				win_config = {
					winblend = 0,
					border = require("config").get_border(),
					winhighlight = "Normal:Folded",
				},
			},
			fold_virt_text_handler = function(virt_text, lnum, end_lnum, width, truncate, ctx)
				local result, cur_width = {}, 0
				local suffix = (" 󰁂 %d "):format(end_lnum - lnum)
				local suffix_width = vim.fn.strdisplaywidth(suffix)
				local target_width = width - suffix_width

				for _, chunk in ipairs(virt_text) do
					local chunk_text = chunk[1]
					local chunk_width = vim.fn.strdisplaywidth(chunk_text)
					if target_width > cur_width + chunk_width then
						table.insert(result, chunk)
					else
						chunk_text = truncate(chunk_text, target_width - cur_width)
						local hl_group = chunk[2]
						table.insert(result, { chunk_text, hl_group })
						chunk_width = vim.fn.strdisplaywidth(chunk_text)
						if cur_width + chunk_width < target_width then
							suffix = suffix .. (" "):rep(target_width - cur_width - chunk_width)
						end
						break
					end
					cur_width = cur_width + chunk_width
				end

				local end_text = ctx.get_fold_virt_text(end_lnum)
				-- reformat the end text to trim excess whitespace
				for _, chunk_text in pairs(end_text) do
					chunk_text[1] = chunk_text[1]:gsub("[%s\t]+", "")
				end

				vim.list_extend(result, { { suffix, "UfoFoldedEllipsis" }, unpack(end_text) })
				return result
			end,
			provider_selector = function()
				return { "treesitter" }
			end,
		},
	},
	-- vim-sandwich
	{
		{
			"machakann/vim-sandwich",
			event = { "User AstroFile", "InsertEnter" },
			dependencies = {
				{
					"AstroNvim/astrocore",
					mappings = {
						n = {
							{ "sa", desc = "Add surrounding" },
							{ "sd", desc = "Delete surrounding" },
							{ "sr", desc = "Replace surrounding" },
						},
						v = {
							{ "sa", desc = "Add surrounding" },
						},
					},
				},
			},
		},
		{
			"catppuccin/nvim",
			optional = true,
			---@type CatppuccinOptions
			opts = { integrations = { sandwich = true } },
		},
	},
	{
		{
			"lukas-reineke/headlines.nvim",
			dependencies = "nvim-treesitter/nvim-treesitter",
			ft = { "markdown", "norg", "org", "rmd" },
			opts = {},
		},
		{
			"catppuccin/nvim",
			optional = true,
			---@type CatppuccinOptions
			opts = { integrations = { headlines = true } },
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
      { "[T", function() 	require("todo-comments").jump_prev()
end, desc = "Prev TODO comment" },
      { "]T", function() 	require("todo-comments").jump_next()
end, desc = "Next TODO comment" },
    },
		opts = function()
			local palette = require("config").palette
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
      { "s", mode = { "n", "x", "o" }, function() 	require("flash").jump()
end, desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() 	require("flash").treesitter()
end, desc = "Flash Treesitter" },
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
