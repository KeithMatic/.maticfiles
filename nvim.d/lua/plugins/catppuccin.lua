return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    ---@type CatppuccinOptions
    opts = {
      flavour = "auto", -- latte, frappe, macchiato, mocha
      -- flavour = "auto" -- will respect terminal's background
      background = { -- :h background
        light = "latte",
        dark = "macchiato",
      },
      transparent_background = true, -- disables setting the background color.
      show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
      term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = { "italic" },
        functions = {},
        keywords = { "italic" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      color_overrides = {},
      custom_highlights = {},
      default_integrations = true,
      integrations = {
        aerial = true,
        alpha = true,
        bufferline = true,
        cmp = true,
        dap = true,
        dap_ui = true,
        dropbar = true,
        gitsigns = true,
        harpoon = true,
        hop = true,
        illuminate = true,
        indent_blankline = true,
        leap = true,
        markdown = true,
        mason = true,
        noice = true,
        native_lsp = true,
        neotree = true,
        notify = true,
        semantic_tokens = true,
        symbols_outline = true,
        telescope = true,
        trouble = false,
        treesitter = true,
        ts_rainbow = true,
        ts_rainbow2 = true,
        rainbow_delimiters = true,
        ufo = true,
        which_key = true,
        window_picker = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    optional = true,
    opts = {
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    },
  },
}
