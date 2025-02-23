return {
	-- -- Autotags
	-- {
	-- 	"windwp/nvim-ts-autotag",
	-- 	opts = {},
	-- },
	--
	-- -- delete buffer
	-- {
	-- 	"famiu/bufdelete.nvim",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		vim.keymap.set(
	-- 			"n",
	-- 			"Q",
	-- 			":lua require('bufdelete').bufdelete(0, false)<cr>",
	-- 			{ noremap = true, silent = true, desc = "Delete buffer" }
	-- 		)
	-- 	end,
	-- },
	--
	-- -- comments
	-- {
	-- 	"numToStr/Comment.nvim",
	-- 	opts = {},
	-- 	lazy = false,
	-- },
	-- -- useful when there are embedded languages in certain types of files (e.g. Vue or React)
	-- { "joosepalviste/nvim-ts-context-commentstring", lazy = true },
	--
	-- -- Neovim plugin to improve the default vim.ui interfaces
	-- {
	-- 	"stevearc/dressing.nvim",
	-- 	dependencies = { "MunifTanjim/nui.nvim" },
	-- 	opts = {},
	-- 	config = function()
	-- 		require("dressing").setup()
	-- 	end,
	-- },
	--
	-- -- Neovim notifications and LSP progress messages
	-- {
	-- 	"j-hui/fidget.nvim",
	-- 	branch = "legacy",
	-- 	enabled = false,
	-- 	config = function()
	-- 		require("fidget").setup({
	-- 			window = { blend = 0 },
	-- 		})
	-- 	end,
	-- },
	--
	-- -- Smooth scrolling neovim plugin written in lua
	-- {
	-- 	"karb94/neoscroll.nvim",
	-- 	config = function()
	-- 		require("neoscroll").setup({
	-- 			stop_eof = true,
	-- 			easing_function = "sine",
	-- 			hide_cursor = true,
	-- 			cursor_scrolls_alone = true,
	-- 		})
	-- 	end,
	-- },
	--
	-- -- find and replace
	-- {
	-- 	"windwp/nvim-spectre",
	-- 	event = "BufRead",
	-- },
	--
	-- -- Add/change/delete surrounding delimiter pairs with ease
	-- {
	-- 	"kylechui/nvim-surround",
	-- 	version = "*",
	-- 	event = "VeryLazy",
	-- 	config = function()
	-- 		require("nvim-surround").setup()
	-- 	end,
	-- },
	--
	-- -- Heuristically set buffer options
	-- {
	-- 	"tpope/vim-sleuth",
	-- },
	--
	-- -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API
	-- {
	-- 	"folke/neodev.nvim",
	-- 	config = function()
	-- 		require("neodev").setup({
	-- 			library = { plugins = { "neotest" }, types = true },
	-- 		})
	-- 	end,
	-- },
	--
	-- -- Neovim Lua plugin to automatically manage character pairs. Part of 'mini.nvim' library.
	-- {
	-- 	"echasnovski/mini.pairs",
	-- 	event = "VeryLazy",
	-- 	config = function(_, opts)
	-- 		require("mini.pairs").setup(opts)
	-- 	end,
	-- },
	--
	-- -- Lorem Ipsum generator for Neovim
	-- {
	-- 	"derektata/lorem.nvim",
	-- 	enabled = false,
	-- 	config = function()
	-- 		local lorem = require("lorem")
	-- 		lorem.setup({
	-- 			sentenceLength = "mixedShort",
	-- 			comma = 1,
	-- 		})
	-- 	end,
	-- },
	--
	-- Indent guide for Neovim
	{
		"lukas-reineke/indent-blankline.nvim",
		event = { "BufReadPost", "BufNewFile" },
		enabled = false,
		version = "2.1.0",
		opts = {
			char = "┊",
			-- char = "│",
			filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
			show_trailing_blankline_indent = false,
			show_current_context = false,
		},
	},
  {
    "gen740/smoothcursor.nvim",
    cond = vim.g.neovide == nil,
    lazy = false,
    opts = {
      autostart = true,
      fancy = { enable = true },
    },
  },
  {
    "jinh0/eyeliner.nvim",
    -- enabled = false,
    lazy = false,
    opts = {
      highlight_on_key = true,
      dim = true,
    },
  },
  {
    "abecodes/tabout.nvim",
    event = { "InsertEnter" },
    opts = {},
  },
  -- {
  --   "abecodes/tabout.nvim",
  --   event = "InsertEnter",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     {
  --       "hrsh7th/nvim-cmp",
  --       opts = function(_, opts)
  --         local cmp, luasnip = require "cmp", require "luasnip"
  --         opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_next_item()
  --           elseif luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" })
  --       end,
  --     },
  --   },
  --   opts = {},
  -- },

	-- -- editor config support
	-- {
	-- 	"editorconfig/editorconfig-vim",
	-- },
	--
	-- -- Enhanced f/t motions for Leap
	-- {
	-- 	"ggandor/flit.nvim",
	-- 	keys = function()
	-- 		---@type LazyKeys[]
	-- 		local ret = {}
	-- 		for _, key in ipairs({ "f", "F", "t", "T" }) do
	-- 			ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
	-- 		end
	-- 		return ret
	-- 	end,
	-- 	opts = { labeled_modes = "nx" },
	-- },
	-- -- mouse replacement
	-- {
	-- 	"ggandor/leap.nvim",
	-- 	keys = {
	-- 		{ "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
	-- 		{ "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
	-- 		{ "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
	-- 	},
	-- 	config = function(_, opts)
	-- 		local leap = require("leap")
	-- 		for k, v in pairs(opts) do
	-- 			leap.opts[k] = v
	-- 		end
	-- 		leap.add_default_mappings(true)
	-- 		vim.keymap.del({ "x", "o" }, "x")
	-- 		vim.keymap.del({ "x", "o" }, "X")
	-- 	end,
	-- },
	--

	-- better code annotation
	-- {
	-- 	"danymat/neogen",
	-- 	dependencies = {
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"L3MON4D3/LuaSnip",
	-- 	},
	-- 	config = function()
	-- 		local neogen = require("neogen")
	--
	-- 		neogen.setup({
	-- 			snippet_engine = "luasnip",
	-- 		})
	-- 	end,
	-- 	-- version = "*"
	-- },
	--
	-- {
	-- 	"ThePrimeagen/refactoring.nvim",
	-- 	enabled = false,
	-- 	dependencies = {
	-- 		{ "nvim-lua/plenary.nvim" },
	-- 		{ "nvim-treesitter/nvim-treesitter" },
	-- 	},
	-- 	config = function()
	-- 		require("refactoring").setup({})
	-- 	end,
	-- },
	--
	-- {
	-- 	"echasnovski/mini.statusline",
	-- 	enabled = false,
	-- 	version = "*",
	-- 	config = function()
	-- 		vim.cmd("highlight MiniStatuslineFilename guifg=#C7D3F8 guibg=#1E2032")
	--
	-- 		local statusline = require("mini.statusline")
	--
	-- 		statusline.setup({
	-- 			use_icons = vim.g.have_nerd_font,
	-- 		})
	--
	-- 		local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
	-- 		local git = statusline.section_git({ trunc_width = 75 })
	-- 		local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
	-- 		local filename = statusline.section_filename({ trunc_width = 140 })
	-- 		local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
	-- 		local location = statusline.section_location({ trunc_width = 75 })
	-- 		local search = statusline.section_searchcount({ trunc_width = 75 })
	--
	-- 		statusline.combine_groups({
	-- 			{ hl = mode_hl, strings = { mode } },
	-- 			{ hl = "MiniStatuslineDevinfo", strings = { git, diagnostics } },
	-- 			"%<", -- Mark general truncate point
	-- 			{ hl = "MiniStatuslineFilename", strings = { filename } },
	-- 			"%=", -- End left alignment
	-- 			{ hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
	-- 			{ hl = mode_hl, strings = { search, location } },
	-- 		})
	-- 	end,
	-- },
}
