local nmap = require("matic.keymap_utils").nnoremap
local vmap = require("matic.keymap_utils").vnoremap
local imap = require("matic.keymap_utils").inoremap
local tmap = require("matic.keymap_utils").tnoremap
local xmap = require("matic.keymap_utils").xnoremap
local harpoon_ui = require("harpoon.ui")
local harpoon_mark = require("harpoon.mark")
local illuminate = require("illuminate")
local utils = require("matic.utils")

local M = {}

local TERM = os.getenv("TERM")

-- Normal --
-- Disable Space bar since it'll be used as the leader key
nmap("<space>", "<nop>")

-- Window +  better kitty navigation
nmap("<C-j>", function()
	if vim.fn.exists(":KittyNavigateDown") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateDown()
	elseif vim.fn.exists(":NvimTmuxNavigateDown") ~= 0 then
		vim.cmd.NvimTmuxNavigateDown()
	else
		vim.cmd.wincmd("j")
	end
end)

nmap("<C-k>", function()
	if vim.fn.exists(":KittyNavigateUp") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateUp()
	elseif vim.fn.exists(":NvimTmuxNavigateUp") ~= 0 then
		vim.cmd.NvimTmuxNavigateUp()
	else
		vim.cmd.wincmd("k")
	end
end)

nmap("<C-l>", function()
	if vim.fn.exists(":KittyNavigateRight") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateRight()
	elseif vim.fn.exists(":NvimTmuxNavigateRight") ~= 0 then
		vim.cmd.NvimTmuxNavigateRight()
	else
		vim.cmd.wincmd("l")
	end
end)

nmap("<C-h>", function()
	if vim.fn.exists(":KittyNavigateLeft") ~= 0 and TERM == "xterm-kitty" then
		vim.cmd.KittyNavigateLeft()
	elseif vim.fn.exists(":NvimTmuxNavigateLeft") ~= 0 then
		vim.cmd.NvimTmuxNavigateLeft()
	else
		vim.cmd.wincmd("h")
	end
end)

-- Swap between last two buffers
nmap("<leader>'", "<C-^>", { desc = "Switch to last buffer" })

-- Save with leader key
nmap("<leader>w", "<cmd>w<cr>", { silent = false })

-- Quit with leader key
nmap("<leader>q", "<cmd>q<cr>", { silent = false })

-- Save and Quit with leader key
nmap("<leader>z", "<cmd>wq<cr>", { silent = false })

-- NeoTree
nmap("<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
nmap("<leader>o", function()
  if vim.bo.filetype == "neo-tree" then
    vim.cmd.wincmd "p"
  else
    vim.cmd.Neotree "focus"
  end
end, { desc = "Toggle Explorer Focus" })
-- Map Oil to <leader>e
-- nmap("<leader>e", function()
-- 	require("oil").toggle_float()
-- end)
-- Center buffer while navigating
nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")
nmap("{", "{zz")
nmap("}", "}zz")
nmap("N", "Nzz")
nmap("n", "nzz")
nmap("G", "Gzz")
nmap("gg", "ggzz")
nmap("<C-i>", "<C-i>zz")
nmap("<C-o>", "<C-o>zz")
nmap("%", "%zz")
nmap("*", "*zz")
nmap("#", "#zz")

-- Press 'S' for quick find/replace for the word under the cursor
nmap("S", function()
	local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
	local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open Spectre for global find/replace
nmap("<leader>S", function()
	require("spectre").toggle()
end)

-- Open Spectre for global find/replace for the word under the cursor in normal mode
nmap("<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word" })

-- Open Spectre for global find/replace for the word under the cursor in visual mode
vmap("<leader>sw", function()
	require("spectre").open_visual({ select_word = true })
end, { desc = "Search current word" })

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
nmap("L", "$")
nmap("H", "^")

-- Press 'U' for undo
nmap("U", "<C-r>")

-- Turn off highlighted results
nmap("<leader>no", "<cmd>noh<cr>")

-- Diagnostics

-- Goto next diagnostic of any severity
nmap("]d", function()
	vim.diagnostic.goto_next({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous diagnostic of any severity
nmap("[d", function()
	vim.diagnostic.goto_prev({})
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next error diagnostic
nmap("]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous error diagnostic
nmap("[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto next warning diagnostic
nmap("]w", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

-- Goto previous warning diagnostic
nmap("[w", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })
	vim.api.nvim_feedkeys("zz", "n", false)
end)

nmap("<leader>d", function()
	vim.diagnostic.open_float({
		border = "rounded",
	})
end)

-- Place all dignostics into a qflist
nmap("<leader>ld", vim.diagnostic.setqflist, { desc = "Quickfix [L]ist [D]iagnostics" })

-- Navigate to next qflist item
nmap("<leader>cn", ":cnext<cr>zz")

-- Navigate to previos qflist item
nmap("<leader>cp", ":cprevious<cr>zz")

-- Open the qflist
nmap("<leader>co", ":copen<cr>zz")

-- Close the qflist
nmap("<leader>cc", ":cclose<cr>zz")

-- Map MaximizerToggle (szw/vim-maximizer) to leader-m
nmap("<leader>m", ":MaximizerToggle<cr>")

-- Resize split windows to be equal size
nmap("<leader>=", "<C-w>=")

-- Press leader f to format
nmap("<leader>f", ":Format<cr>")

-- Press leader rw to rotate open windows
nmap("<leader>rw", ":RotateWindows<cr>", { desc = "[R]otate [W]indows" })

-- Press gx to open the link under the cursor
nmap("gx", ":sil !open <cWORD><cr>", { silent = true })

-- TSC autocommand keybind to run TypeScripts tsc
nmap("<leader>tc", ":TSC<cr>", { desc = "[T]ypeScript [C]ompile" })

-- Harpoon keybinds --
-- Open harpoon ui
nmap("<leader>ho", function()
	harpoon_ui.toggle_quick_menu()
end)

-- Add current file to harpoon
nmap("<leader>ha", function()
	harpoon_mark.add_file()
end)

-- Remove current file from harpoon
nmap("<leader>hr", function()
	harpoon_mark.rm_file()
end)

-- Remove all files from harpoon
nmap("<leader>hc", function()
	harpoon_mark.clear_all()
end)

-- Quickly jump to harpooned files
nmap("<leader>1", function()
	harpoon_ui.nav_file(1)
end)

nmap("<leader>2", function()
	harpoon_ui.nav_file(2)
end)

nmap("<leader>3", function()
	harpoon_ui.nav_file(3)
end)

nmap("<leader>4", function()
	harpoon_ui.nav_file(4)
end)

nmap("<leader>5", function()
	harpoon_ui.nav_file(5)
end)

-- Git keymaps --
nmap("<leader>gb", ":Gitsigns toggle_current_line_blame<cr>")
nmap("<leader>gf", function()
	local cmd = {
		"sort",
		"-u",
		"<(git diff --name-only --cached)",
		"<(git diff --name-only)",
		"<(git diff --name-only --diff-filter=U)",
	}

	if not utils.is_git_directory() then
		vim.notify(
			"Current project is not a git directory",
			vim.log.levels.WARN,
			{ title = "Telescope Git Files", git_command = cmd }
		)
	else
		require("telescope.builtin").git_files()
	end
end, { desc = "Search [G]it [F]iles" })

-- Telescope keybinds --
nmap("<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
nmap("<leader>sb", require("telescope.builtin").buffers, { desc = "[S]earch Open [B]uffers" })
nmap("<leader>sf", function()
	require("telescope.builtin").find_files({ hidden = true })
end, { desc = "[S]earch [F]iles" })
nmap("<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
nmap("<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
nmap("<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
nmap("<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
nmap("<leader>sd", require("telescope.builtin").git_files, { desc = "[S]earch [D]iagnostics" })

nmap("<leader>sc", function()
	require("telescope.builtin").commands(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [C]ommands" })

nmap("<leader>/", function()
	require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer]" })

nmap("<leader>ss", function()
	require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({
		previewer = false,
	}))
end, { desc = "[S]earch [S]pelling suggestions" })

-- LSP Keybinds (exports a function to be used in ../../after/plugin/lsp.lua b/c we need a reference to the current buffer) --
M.map_lsp_keybinds = function(buffer_number)
	nmap("<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame", buffer = buffer_number })
	nmap("<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction", buffer = buffer_number })

	nmap("gd", vim.lsp.buf.definition, { desc = "LSP: [G]oto [D]efinition", buffer = buffer_number })

	-- Telescope LSP keybinds --
	nmap(
		"gr",
		require("telescope.builtin").lsp_references,
		{ desc = "LSP: [G]oto [R]eferences", buffer = buffer_number }
	)

	nmap(
		"gi",
		require("telescope.builtin").lsp_implementations,
		{ desc = "LSP: [G]oto [I]mplementation", buffer = buffer_number }
	)

	nmap(
		"<leader>bs",
		require("telescope.builtin").lsp_document_symbols,
		{ desc = "LSP: [B]uffer [S]ymbols", buffer = buffer_number }
	)

	nmap(
		"<leader>ps",
		require("telescope.builtin").lsp_workspace_symbols,
		{ desc = "LSP: [P]roject [S]ymbols", buffer = buffer_number }
	)

	-- See `:help K` for why this keymap
	nmap("K", vim.lsp.buf.hover, { desc = "LSP: Hover Documentation", buffer = buffer_number })
	nmap("<leader>k", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })
	imap("<C-k>", vim.lsp.buf.signature_help, { desc = "LSP: Signature Documentation", buffer = buffer_number })

	-- Lesser used LSP functionality
	nmap("gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration", buffer = buffer_number })
	nmap("td", vim.lsp.buf.type_definition, { desc = "LSP: [T]ype [D]efinition", buffer = buffer_number })
end

-- Symbol Outline keybind
nmap("<leader>so", ":SymbolsOutline<cr>")

-- Vim Illuminate keybinds
nmap("<leader>]", function()
	illuminate.goto_next_reference()
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto next reference" })

nmap("<leader>[", function()
	illuminate.goto_prev_reference()
	vim.api.nvim_feedkeys("zz", "n", false)
end, { desc = "Illuminate: Goto previous reference" })

-- Open Copilot panel
nmap("<leader>oc", function()
	require("copilot.panel").open({})
end, { desc = "[O]pen [C]opilot panel" })

-- nvim-ufo keybinds
nmap("zR", require("ufo").openAllFolds)
nmap("zM", require("ufo").closeAllFolds)

-- Insert --
-- Map jj to <esc>
imap("jj", "<esc>")
-- go to  beginning and end
imap("<C-a>", "<ESC>^i", { desc = "Go to beginning of line", remap = true })
imap("<C-e>", "<End>", { desc = "Go to end of line", remap = true })
-- navigate within insert mode
imap("<C-h>", "<Left>", { desc = "Move left", remap = true })
imap("<C-l>", "<Right>", { desc = "Move right", remap = true })
imap("<C-j>", "<Down>", { desc = "Move down", remap = true })
imap("<C-k>", "<Up>", { desc = "Move up", remap = true })

-- Visual --
-- Disable Space bar since it'll be used as the leader key
vmap("<space>", "<nop>")

-- Press 'H', 'L' to jump to start/end of a line (first/last char)
vmap("L", "$<left>")
vmap("H", "^")

-- Paste without losing the contents of the register
xmap("<leader>p", '"_dP')

-- Move selected text up/down in visual mode
vmap("<A-j>", ":m '>+1<CR>gv=gv")
vmap("<A-k>", ":m '<-2<CR>gv=gv")

-- Reselect the last visual selection
xmap("<<", function()
	vim.cmd("normal! <<")
	vim.cmd("normal! gv")
end)

xmap(">>", function()
	vim.cmd("normal! >>")
	vim.cmd("normal! gv")
end)

-- Terminal --
-- Enter normal mode while in a terminal
tmap("<esc>", [[<C-\><C-n>]])
tmap("jj", [[<C-\><C-n>]])

-- Window navigation from terminal
tmap("<C-h>", [[<Cmd>wincmd h<CR>]])
tmap("<C-j>", [[<Cmd>wincmd j<CR>]])
tmap("<C-k>", [[<Cmd>wincmd k<CR>]])
tmap("<C-l>", [[<Cmd>wincmd l<CR>]])

-- Reenable default <space> functionality to prevent input delay
tmap("<space>", "<space>")

return M
