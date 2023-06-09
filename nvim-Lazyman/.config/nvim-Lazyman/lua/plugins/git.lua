return {
  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "wintermute-cell/gitignore.nvim",
    lazy = true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
  },

  {
    "junegunn/gv.vim",
    lazy = false,
  },

  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      disable_signs = false,
      disable_hint = false,
      disable_context_highlighting = false,
      disable_commit_confirmation = false,
      -- customize displayed signs
      signs = {
        -- { CLOSED, OPENED }
        section = { ">", "v" },
        item = { ">", "v" },
        hunk = { "", "" },
      },
      integrations = { diffview = true },
      -- override/add mappings
      mappings = {
        -- modify status buffer mappings
        status = {
          -- Adds a mapping with "B" as key that does the "BranchPopup" command
          -- ["B"] = "BranchPopup",
          -- ["C"] = "CommitPopup",
          -- ["P"] = "PullPopup",
          -- ["S"] = "Stage",
          -- ["D"] = "Discard",
          -- Removes the default mapping of "s"
          -- ["s"] = "",
        },
      },
    },
  },
  {
    "pwntester/octo.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup()
    end,
  },
}
