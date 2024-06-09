local macro = require "util.macro"

require("util.map").set_keymaps {
  -- first key is the mode
  n = {
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", desc = "telescope find files" },
    -- Oil biddings
    ["<Leader>O"] = {
      function() require("oil").open() end,
      desc = "Open folder in Oil",
    },

    ["-"] = { "<CMD>Oil --float<CR>", desc = "Open parent directory" },
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
    -- Copy whole file
    ["<C-c>"] = { "<cmd>%y+<CR>", desc = "file copy whole" },
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
