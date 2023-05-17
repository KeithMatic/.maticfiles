-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- shorten function name
local keymap = vim.keymap.set
-- silent keymap option
local opts = { silent = true }

-- better escape using 'jk'
keymap("i", "jk", "<ESC>", opts)
