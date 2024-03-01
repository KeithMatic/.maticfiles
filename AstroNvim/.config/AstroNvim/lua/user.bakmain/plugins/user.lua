return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  "andweeb/presence.nvim",

  --------------------------------------------------------------------------------------------  lsp_signature

  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  --------------------------------------------------------------------------------------------  tokyonight

  { "folke/tokyonight.nvim" },

  --------------------------------------------------------------------------------------------  flit

  {
    "ggandor/flit.nvim",
    event = "BufRead",
    dependencies = "ggandor/leap.nvim",
    opts = {},
  },

  --------------------------------------------------------------------------------------------  dropbar
  -- IDE-like breadcrumbs, out of the box -- This also disables the Heirline based winbar
  -- {
  --   { "Bekaboo/dropbar.nvim", event = "VeryLazy", opts = {} },
  --   {
  --     "rebelot/heirline.nvim",
  --     optional = true,
  --     opts = function(_, opts) opts.winbar = nil end,
  --   },
  -- },
  --
  --------------------------------------------------------------------------------------------  cheatsheet

  {
    "sudormrfbin/cheatsheet.nvim",

    dependencies = {
      { "nvim-telescope/telescope.nvim" },
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {},
  },
  {
    "RishabhRD/nvim-cheat.sh",
    dependencies = {
      "RishabhRD/popfix",
    },
  },
  ------ movement ------
  ----------------------

  {
    "jinh0/eyeliner.nvim",
    -- enabled = false,
    lazy = false,
    opts = {
      highlight_on_key = true,
      dim = true,
    },
  },
  {
    "gen740/smoothcursor.nvim",
    cond = vim.g.neovide == nil,
    lazy = false,
    opts = {
      autostart = true,
      fancy = { enable = true },
    },
  },
  -- Text Manipulation --
  -----------------------

  {
    "echasnovski/mini.ai",
    event = "User AstroFile",
    config = function() require("mini.ai").setup() end,
  },

  {
    "kylechui/nvim-surround",
    event = "User AstroFile",
    opts = {
      keymaps = {
        normal = "sa",
        normal_cur = "sv",
        normal_line = "ss",
        normal_curl_line = "sS",
        visual = "s",
        delete = "sd",
        change = "sr",
      },
      aliases = {
        ["u"] = { "}", "]", ")", ">", '"', "'", "`" },
      },
    },
  },

  ------ git ------
  -----------------

  {
    "sindrets/diffview.nvim",
    event = "User AstroGitFile",
  },
}
