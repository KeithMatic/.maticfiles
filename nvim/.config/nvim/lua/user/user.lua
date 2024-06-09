-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- {
  --   "windwp/nvim-autopairs",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom autopairs configuration such as custom rules
  --     local npairs = require "nvim-autopairs"
  --     local Rule = require "nvim-autopairs.rule"
  --     local cond = require "nvim-autopairs.conds"
  --     npairs.add_rules(
  --       {
  --         Rule("$", "$", { "tex", "latex" })
  --           -- don't add a pair if the next character is %
  --           :with_pair(cond.not_after_regex "%%")
  --           -- don't add a pair if  the previous character is xxx
  --           :with_pair(
  --             cond.not_before_regex("xxx", 3)
  --           )
  --           -- don't move right when repeat character
  --           :with_move(cond.none())
  --           -- don't delete if the next character is xx
  --           :with_del(cond.not_after_regex "xx")
  --           -- disable adding a newline when you press <cr>
  --           :with_cr(cond.none()),
  --       },
  --       -- disable for .vim files, but it work for another filetypes
  --       Rule("a", "a", "-vim")
  --     )
  --   end,
  -- },
  -- -- syntax
  {
    "junegunn/vim-easy-align",
    event = "VeryLazy",
  },
  -- scrolling
  -- { "declancm/cinnamon.nvim", event = "VeryLazy", opts = {} },
  {
    "ggandor/flit.nvim",
    keys = function()
      ---@type LazyKeys[]
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
    dependencies = {
      "ggandor/leap.nvim",
      dependencies = {
        "tpope/vim-repeat",
      },
    },
  },
    {
    "abecodes/tabout.nvim",
    event = { "VeryLazy" },
    opts = {},
  },


  -- {
  --   "abecodes/tabout.nvim",
  --   event = { "InsertEnter" },
  --   opts = {},
  -- },
  -- {
  --   "abecodes/tabout.nvim",
  --   event = "InsertEnter",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter",
  --     {
  --       "hrsh7th/nvim-cmp",
  --       opts = function(_, opts)
  --         local cmp, luasnip = require "cmp", require "luasnip"
  --         opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
  --           if cmp.visible() then
  --             cmp.select_next_item()
  --           elseif luasnip.expand_or_jumpable() then
  --             luasnip.expand_or_jump()
  --           else
  --             fallback()
  --           end
  --         end, { "i", "s" })
  --       end,
  --     },
  --   },
  --   opts = {},
  -- },
  {
    "max397574/better-escape.nvim",
    opts = {},
  },
  -- {
  --   {
  --     "HiPhish/rainbow-delimiters.nvim",
  --     dependencies = "nvim-treesitter/nvim-treesitter",
  --     event = "User AstroFile",
  --     main = "rainbow-delimiters.setup",
  --   },
  --   {
  --     "catppuccin/nvim",
  --     optional = true,
  --     ---@type CatppuccinOptions
  --     opts = { integrations = { rainbow_delimiters = true } },
  --   },
  -- },
  ------ movement ------
  ----------------------
  {
    {
      "echasnovski/mini.bracketed",
      event = "BufEnter",
      opts = {},
    },
    {
      "catppuccin/nvim",
      optional = true,
      ---@type CatppuccinOptions
      opts = { integrations = { mini = true } },
    },
  },

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
}
