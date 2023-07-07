return {
  -- Add the community repository of plugin specifications
  -- Available plugins can be found at https://github.com/AstroNvim/astrocommunity
  "AstroNvim/astrocommunity",
  -- example of imporing a plugin, comment out to use it or add your own
  -- --------- Packs ------------
  { import = "astrocommunity.pack.rust" },
  {
    "rust-tools.nvim",
    opts = {
      tools = {
        -- rust-tools options
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
          auto = true,
          only_current_line = false,
          show_parameter_hints = true,
          highlight = "Cursor",
        },
        hover_actions = {
          border = {
            { "╒", "FloatBorder" },
            { "═", "FloatBorder" },
            { "╕", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╛", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╘", "FloatBorder" },
            { "│", "FloatBorder" },
          },
          auto_focus = true,
        },
      },
    },
  },
  { import = "astrocommunity.pack.typescript-all-in-one" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.yaml" },
  -- --------- completion -------
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.motion.mini-move" },
  -- --------- bar and lines ----
  { import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline", enabled = true },
  -- --------- editing-support ------
  { import = "astrocommunity.editing-support.nvim-ts-rainbow2" },
  { import = "astrocommunity.editing-support.mini-splitjoin" },
  -- --------- scrolling --------
  { import = "astrocommunity.scrolling.mini-animate" },
  -- --------- colorscheme ------
  { import = "astrocommunity.colorscheme.everforest", enabled = true },
  { import = "astrocommunity.colorscheme.nightfox", enabled = false },
  { import = "astrocommunity.colorscheme.rose-pine", enabled = true },
  { import = "astrocommunity.colorscheme.catppuccin", enabled = true },

  {
    -- further customize the options set by the community
    "catppuccin",
    opts = {
      flavour = "macchiato", -- latte, frappe, macchiato, mocha
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "italic" },
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      integrations = {
        sandwich = false,
        noice = true,
        mini = true,
        leap = true,
        markdown = true,
        neotest = true,
        cmp = true,
        overseer = true,
        lsp_trouble = true,
        ts_rainbow2 = true,
        ts_rainbow = false,
        aerial = true,
        dap = { enabled = true, enable_ui = true },
        headlines = true,
        mason = true,
        neotree = true,
        notify = true,
        octo = true,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = true,
        which_key = true,
      },
    },
  },
  { import = "astrocommunity.completion.copilot-lua", enabled = false },
  -- {
  --   -- further customize the options set by the community
  --   "copilot.lua",
  --   opts = {
  --     suggestion = {
  --       keymap = {
  --         accept = "<C-l>",
  --         accept_word = false,
  --         accept_line = false,
  --         next = "<C-.>",
  --         prev = "<C-,>",
  --         dismiss = "<C/>",
  --       },
  --     },
  --   },
  -- },
  { import = "astrocommunity.bars-and-lines.smartcolumn-nvim" },
  {
    "m4xshen/smartcolumn.nvim",
    opts = {
      colorcolumn = 120,
      disabled_filetypes = { "help" },
    },
  },
}
