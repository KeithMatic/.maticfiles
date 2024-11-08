local Util = require("mvim.util")
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- keymap( "n", "/" , "<cmd>Telescope search noice<CR>", { noremap = true })

-- navigate within insert mode
keymap("i", "<C-h>", "<Left>", { desc = "Move left", remap = true })
keymap("i", "<C-l>", "<Right>", { desc = "Move right", remap = true })
keymap("i", "<C-j>", "<Down>", { desc = "Move down", remap = true })
keymap("i", "<C-k>", "<Up>", { desc = "Move up", remap = true })

-- NeoTree
keymap("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
keymap("n", "<leader>o", function()
	if vim.bo.filetype == "neo-tree" then
		vim.cmd.wincmd("p")
	else
		vim.cmd.Neotree("focus")
	end
end, { desc = "Toggle Explorer Focus" })

-- Map Oil to <leader>e
-- keymap("<leader>e", function()
-- 	require("oil").toggle_float()
-- end, { desc = "Toggle Oil Explorer" })

-- Editing: oil
keymap("n", "-", "<CMD>Oil --float<CR>", { desc = "Open Oil parent directory" })

-- Editing: write
keymap("n", "<leader>w", "<Cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>W", "<Cmd>wa<CR>", { desc = "Save files" })

-- Turn off highlighted results
keymap("n", "<leader>no", "<cmd>noh<cr>")

-- Editing: quit
keymap("n", "<leader>q", "<Cmd>q<CR>", { desc = "Quit" })
keymap("n", "<leader>Q", "<Cmd>q!<CR>", { desc = "Force quit" })

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

-- Split window
keymap("n", "<leader>-", "<C-W>s", { desc = "Split below" })
keymap("n", "<leader>|", "<C-W>v", { desc = "Split right" })

-- Move to window
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize window
keymap("n", "<Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
keymap("n", "<Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap("n", "<Left>", "<Cmd>vertical resize -2<CR>", { desc = "Increase window width" })
keymap("n", "<Right>", "<Cmd>vertical resize +2<CR>", { desc = "Decrease window width" })

-- Panes resizing
keymap("n", "+", ":vertical resize +5<CR>")
keymap("n", "_", ":vertical resize -5<CR>")
keymap("n", "=", ":resize +5<CR>")
keymap("n", "-", ":resize -5<CR>")

-- Keykeymap enter to ciw in normal mode
keymap("n", "<CR>", "ciw", opts)
keymap("n", "<BS>", "ci", opts)

-- Vertical split
keymap("n", "<Leader>2", ":vsplit<CR>", opts)

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

-- diagnostic
local diagnostic_goto = function(next, severity)
	local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	severity = severity and vim.diagnostic.severity[severity] or nil
	return function()
		go({ severity = severity })
	end
end
keymap("n", "<leader>cd", function()
	vim.diagnostic.open_float({ scope = "cursor", force = false })
end, { desc = "Line Diagnostic" })
keymap("n", "]d", diagnostic_goto(true), { desc = "Next Diagnostic" })
keymap("n", "[d", diagnostic_goto(false), { desc = "Prev Diagnostic" })
keymap("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Next Error" })
keymap("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Prev Error" })
keymap("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Next Warning" })
keymap("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Prev Warning" })

-- stylua: ignore start

-- Lazygit
keymap("n", "<leader>gg", function() Util.terminal({ "lazygit" }) end, { desc = "Lazygit" })

-- Code format
keymap("n", "<leader>of", function() Util.format.toggle() end, { desc = "Toggle auto format(global)" })
keymap("n", "<leader>oF", function() Util.format.toggle(true) end, { desc = "Toggle auto format(buffer)" })
keymap({ "n", "v" }, "<leader>cf", function() Util.format.format({ force = true }) end, { desc = "Code format" })


keymap("n", "<leader>oh", function() Util.toggle.inlay_hints() end, { desc = "Toggle Inlay Hints" })
keymap("n", "<leader>os", function() Util.toggle("spell") end, { desc = "Toggle spelling" })

keymap("n", "<leader>ow", function() Util.toggle("wrap") end, { desc = "Toggle word wrap" })

-- Code Runner 
keymap("n", "<leader>rc", ":RunCode<CR>", opts)
keymap("n", "<leader>rf", ":RunFile<CR>", opts)
keymap("n", "<leader>rft", ":RunFile tab<CR>", opts)
keymap("n", "<leader>rp", ":RunProject<CR>", opts)
keymap("n", "<leader>rcc", ":RunClose<CR>", opts)
keymap("n", "<leader>crf", ":CRFiletype<CR>", opts)
keymap("n", "<leader>crp", ":CRProjects<CR>", opts)

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

-- Toggle Terminal
keymap("n", "<leader>;", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })