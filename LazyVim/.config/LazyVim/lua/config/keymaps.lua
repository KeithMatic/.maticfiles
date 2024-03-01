-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
local map = vim.keymap.set

map("n", "<leader>r", ":RunCode<CR>", { noremap = true, silent = false })
map("n", "<leader>rf", ":RunFile<CR>", { noremap = true, silent = false })
map("n", "<leader>rft", ":RunFile tab<CR>", { noremap = true, silent = false })
map("n", "<leader>rp", ":RunProject<CR>", { noremap = true, silent = false })
map("n", "<leader>rc", ":RunClose<CR>", { noremap = true, silent = false })
map("n", "<leader>crf", ":CRFiletype<CR>", { noremap = true, silent = false })
map("n", "<leader>crp", ":CRProjects<CR>", { noremap = true, silent = false })
-- go to  beginning and end
map("i", "<C-a>", "<ESC>^i", { desc = "Go to beginning of line", remap = true })
map("i", "<C-e>", "<End>", { desc = "Go to end of line", remap = true })
-- navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "Move left", remap = true })
map("i", "<C-l>", "<Right>", { desc = "Move right", remap = true })
map("i", "<C-j>", "<Down>", { desc = "Move down", remap = true })
map("i", "<C-k>", "<Up>", { desc = "Move up", remap = true })

