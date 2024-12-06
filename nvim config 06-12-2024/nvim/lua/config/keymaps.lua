-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- local Util = require("mvim.util")
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- go to  beginning and end
keymap("i","<C-a>", "<ESC>^i", {desc = "Go to beginning of line", remap = true })
keymap("i","<C-e>", "<End>", {desc = "Go to end of line", remap = true })
-- navigate within insert mode
keymap("i", "<C-h>", "<Left>", { desc = "Move left", remap = true })
keymap("i", "<C-l>", "<Right>", { desc = "Move right", remap = true })
keymap("i", "<C-j>", "<Down>", { desc = "Move down", remap = true })
keymap("i", "<C-k>", "<Up>", { desc = "Move up", remap = true })

-- NeoTree
keymap("n", "<leader>o", function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd.Neotree("focus")
	end
end, { desc = "Toggle Explorer Focus" })

-- Motion
keymap("n", "<leader>;", "%", { desc = "Jump to match item" })

-- Motion
keymap({ "n", "x" }, "H", "^", { desc = "To the first non-blank char of the line" })
keymap({ "n", "x" }, "L", "$", { desc = "To the end of the line" })

-- Move line
keymap("n", "<M-k>", "<Cmd>move .-2<CR>==", { desc = "Move up" })
keymap("n", "<M-j>", "<Cmd>move .+1<CR>==", { desc = "Move down" })
keymap("i", "<M-k>", "<Esc><Cmd>move .-2<CR>==gi", { desc = "Move up" })
keymap("i", "<M-j>", "<Esc><Cmd>move .+1<CR>==gi", { desc = "Move down" })
keymap("v", "<M-k>", ":move '<-2<cr>gv=gv", { desc = "Move up" })
keymap("v", "<M-j>", ":move '>+1<cr>gv=gv", { desc = "Move down" })

-- Move to window
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Keykeymap enter to ciw in normal mode
keymap("n", "<CR>", "ciw", opts)
keymap("n", "<BS>", "ci", opts)

-- Select all
keymap("n", "<C-a>", "ggVG", opts)

-- Saner behavior of n and N
keymap("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next search result" })
keymap("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
keymap("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev search result" })
keymap("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
keymap("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- better indenting
keymap("v", ">", ">gv", { desc = "Visual shifting" })
keymap("v", "<", "<gv", { desc = "Visual shifting" })

-- paste over currently selected text without yanking it
keymap("v", "p", '"_dp')
keymap("v", "P", '"_dP')

-- Clear search with <esc>
keymap({ "i", "n" }, "<esc>", "<Cmd>nohlsearch<CR><Esc>", { desc = "Escape and clear hlsearch" })

-- Better up/down
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, desc = "Move cursor up" })
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, desc = "Move cursor down" })

keymap("i", "jk", [[col('.') == 1 ? '<Esc>' : '<Esc>l']], { expr = true })

-- Rename
-- keymap("n", "yr", { name = " Replace" })
keymap("n", "yrw", "yiw:s/\\C\\<<C-R>0\\>/", { desc = "Replace word"})
keymap("n", "yrW", "yiW:s/\\C\\<<C-R>0\\>/", { desc = "Replace word"})
keymap("n", "yre", "ye:s/\\C\\<<C-R>0\\>/", { desc = "Replace word"})
keymap("n", "yrE", "yE:s/\\C\\<<C-R>0\\>/", { desc = "Replace word"})
    --
keymap("n", "<F2>", "y:%s/<C-R>0/", opts)
keymap("n", "<F2><F2>", "y:%s/<C-R>0/", opts)

    -- delete
keymap("n", "d.", "viwhd", {desc = "Delete extra space"})

    -- Redo
keymap("n", "U", "<cmd>redo<CR>", {desc = "Redo"})

        -- Copy whole file
keymap("n", "<C-c>", "<cmd>%y+<CR>", {desc = "file copy whole" })


    -- tailwind bearable to work with
keymap("x", "j", "gj" )
keymap("x", "k", "gk")

-- Code Runner 
keymap("n", "<leader>rc", ":RunCode<CR>", opts)
keymap("n", "<leader>rf", ":RunFile<CR>", opts)
keymap("n", "<leader>rft", ":RunFile tab<CR>", opts)
keymap("n", "<leader>rp", ":RunProject<CR>", opts)
keymap("n", "<leader>rcc", ":RunClose<CR>", opts)
keymap("n", "<leader>crf", ":CRFiletype<CR>", opts)
keymap("n", "<leader>crp", ":CRProjects<CR>", opts)