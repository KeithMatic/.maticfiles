-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Keymaps for better default experience
local macro = require "user.util.macro"

require("user.util.map").set_keymaps {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<Leader>bD"] = {
      function()
        require("astroui.status").heirline.buffer_picker(function(bufnr) require("astrocore.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<Leader>b"] = { name = "Buffers" },
    -- quick save
    ["<C-s>"] = { ":w!<cr>", desc = "Save File" }, -- change description but the same command

    -- Search
    ["n"] = { macro.better_search "n", desc = "Next search with center and unfold" },
    ["N"] = { macro.better_search "N", desc = "previous search with center and unfold" },

    ["<S-l>"] = {
      function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = "Next buffer",
    },
    ["<S-h>"] = {
      function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = "Previous buffer",
    },
    ["<M-l>"] = {},
    ["<M-h>"] = {},

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
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
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
  },
}
