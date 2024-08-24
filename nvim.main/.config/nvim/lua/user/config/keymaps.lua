local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local macro = require("user.util.macro")

require("user.util.map").set_keymaps({
	-- first key is the mode
	n = {
		--     vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
		-- vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
		-- -- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

		["<RightMouse>"] = { "<cmd>:popup mousemenu<CR>" },
		-- ["<Tab>"] =
		["<Tab>"] = { "<cmd>:popup mousemenu<CR>" },
		-- ["<Tab>"] =
		-- second key is the lefthand side of the map
		-- tables with the `name` key will be registered with which-key if it's installed
		-- this is useful for naming menus
		["<Leader>b"] = { name = "Buffers" },
		-- quick save
		["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

		-- Search
		["n"] = { macro.better_search("n"), desc = "Next search with center and unfold" },
		["N"] = { macro.better_search("N"), desc = "previous search with center and unfold" },

		["<S-l>"] = {
			function()
				require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1)
			end,
			desc = "Next buffer",
		},
		["<S-h>"] = {
			function()
				require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1))
			end,
			desc = "Previous buffer",
		},
		["<M-l>"] = {},
		["<M-h>"] = {},

		["<C-i>"] = { "<C-i>" },
		-- Better window navigation
		["<m-h>"] = { "<C-w>h" }, -- switch to last buffer
		["<m-j>"] = { "<C-w>j" }, -- switch to last buffer
		["<m-k>"] = { "<C-w>k" }, -- switch to last buffer
		["<m-l>"] = { "<C-w>l" }, -- switch to last buffer
		["<m-tab]"] = { "<c-6>" }, -- switch to last buffer

		["n"] = { "nzz" },
		["N"] = { "Nzz" },
		["*"] = { "*zz" },
		["#"] = { "#zz" },
		["g*"] = { "g*zz" },
		["g#"] = { "g#zz" },
		-- Rename
		["yr"] = { name = " Replace" },
		["yrw"] = { "yiw:s/\\C\\<<C-R>0\\>/", desc = "Replace word", opts = { silent = false } },
		["yrW"] = { "yiW:s/\\C\\<<C-R>0\\>/", desc = "Replace word", opts = { silent = false } },
		["yre"] = { "ye:s/\\C\\<<C-R>0\\>/", desc = "Replace word", opts = { silent = false } },
		["yrE"] = { "yE:s/\\C\\<<C-R>0\\>/", desc = "Replace word", opts = { silent = false } },
		--
		["<F2>"] = { "y:%s/<C-R>0/", opts = { silent = false } },
		["<F2><F2>"] = { "y:%s/<C-R>0/", opts = { silent = false } },

		-- delete
		["d."] = { "viwhd", desc = "Delete extra space" },

		--
		["U"] = { "<cmd>redo<CR>", desc = "Redo" },

		-- Toggles
		["<leader>u1"] = { "<cmd>AerialToggle<CR>", desc = "Toggle Aerial" },

		-- ["<leader>w"] = {":lua vim.wo.wrap = not vim.wo.wrap<CR>"},
		-- tailwind bearable to work with
		["j"] = { "gj" },
		["k"] = { "gk" },
	},
	-- t = {
	-- 	-- setting a mapping to false will disable it
	-- 	-- ["<esc>"] = false,
	-- },
	i = {
		["<M-o>"] = { "<C-o>o" },
		["<M-O>"] = { "<C-o>O" },
		["<M-j>"] = { "<cmd>><cr>", desc = "indent" },
		["<M-h>"] = { "<cmd><<cr>", desc = "indent" },
		["<M-l>"] = { "<cmd>><cr>", desc = "indent" },

		-- go to  beginning and end
		["<C-a>"] = { "<ESC>^i", desc = "Go to beginning of line", remap = true },
		["<C-e>"] = { "<End>", desc = "Go to end of line", remap = true },
		-- navigate within insert mode
		["<C-h>"] = { "<Left>", desc = "Move left", remap = true },
		["<C-l>"] = { "<Right>", desc = "Move right", remap = true },
		["<C-j>"] = { "<Down>", desc = "Move down", remap = true },
		["<C-k>"] = { "<Up>", desc = "Move up", remap = true },
	},
	v = {
		["r"] = { "y:s/\\C\\<<C-R>0\\>/", opts = { silent = false } },
		["<F2>"] = { "'<'>%s/\\C<C-R>0/", opts = { silent = false } },
		["<F2><F2>"] = { "'<'>s/\\C<C-R>0/", opts = { silent = false } },

		-- Stay in indent mode
		["<"] = { "<gv" },
		[">"] = { ">gv" },
	},
	x = {
		["p"] = { [["_dP]] },
		-- tailwind bearable to work with
		["j"] = { "gj" },
		["k"] = { "gk" },
	},

	-- more good
	-- "o", "x" }, "<s-h>", "^"},
	-- "o", "x" }, "<s-l>", "g_"},
})


-- vim.api.nvim_set_keymap("t", "<C-;>", "<C-\\><C-n>", opts)

-- working with whichkey

-- local wk = require("which-key")

-- -- flash
-- wk.register({
-- 	-- flash search
-- 	l = {
-- 		name = "flash",
-- 		s = {
-- 			function()
-- 				require("flash").jump()
-- 			end,
-- 			"Flash Jump",
-- 		},
-- 		t = {
-- 			function()
-- 				require("flash").treesitter()
-- 			end,
-- 			"Flash Treesitter",
-- 		},
-- 		r = {
-- 			function()
-- 				require("flash").treesitter_search()
-- 			end,
-- 			"Flash Treesitter Search",
-- 		},
-- 	},
-- }, { prefix = "<leader>" })

-- wk.register({
-- 	g = {
-- 		name = "Gitsigns",
-- 		s = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Hunk" },
-- 		u = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Undo Stage Hunk" },
-- 		r = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Hunk" },
-- 		p = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Hunk" },
-- 		b = { "<cmd>lua require('gitsigns').blame_line()<cr>", "Blame Line" },
-- 		f = { "<cmd>lua require('gitsigns').diffthis('~1')<cr>", "Diff This" },
-- 		n = { "<cmd>lua require('gitsigns').next_hunk()<cr>", "Blame Line" },
-- 	},
-- }, { prefix = "<leader>" })

-- wk.register({
-- 	l = {
-- 		name = "Lspsaga",
-- 		c = { "<cmd>Lspsaga code_action<cr>", "Code Action" },
-- 		o = { "<cmd>Lspsaga outline<cr>", "Outline" },
-- 		r = { "<cmd>Lspsaga rename<cr>", "Rename" },
-- 		d = { "<cmd>Lspsaga goto_definition<cr>", "Lsp GoTo Definition" },
-- 		f = { "<cmd>Lspsaga finder<cr>", "Lsp Finder" },
-- 		p = { "<cmd>Lspsaga preview_definition<cr>", "Preview Definition" },
-- 		s = { "<cmd>Lspsaga signature_help<cr>", "Signature Help" },
-- 		w = { "<cmd>Lspsaga show_workspace_diagnostics<cr>", "Show Workspace Diagnostics" },
-- 	},
-- }, { prefix = "<leader>" })