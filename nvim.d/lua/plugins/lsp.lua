return {
  -- Show function signature when you type.
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      opts = {
        hint_enable = false, -- disable hints as it will crash in some terminal
      },
    },
  },
  -- adds support for file operations using built-in LSP by integrating neo-tree.
  {
    "antosha417/nvim-lsp-file-operations",
    -- lazy will handle loading nvim-tree and neo-tree appropriately based on the module load and our `init` function
    lazy = true,
    -- lazily load plugin after a tree plugin is loaded
    init = function(plugin) require("astrocore").on_load({ "neo-tree.nvim", "nvim-tree.lua" }, plugin.name) end,
    main = "lsp-file-operations", -- set the main module name where the `setup` function is
    opts = {},
  },
}
