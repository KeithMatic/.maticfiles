return {
  "folke/tokyonight.nvim",
  -- lazy = false,
  priority = 1000,
  opts = {
    style = "moon", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
    transparent = true, -- Enable this to disable setting the background color
    -- transparent = vim.g.neovide == nil, -- Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim                                                                                                  |
    styles = {
      -- Style to be applied to different syntax groups
      -- Value is any valid attr-list value `:help attr-list`
      comments = "italic",
      keywords = "italic",
      functions = "italic",
      variables = "NONE",
      -- Background styles. Can be "dark", "transparent" or "normal"
      sidebars = "transparent", -- style for sidebars, see below
      floats = "transparent", -- style for floating windows
    },
    sidebars = { "qf", "help", "vista_kind", "terminal", "packer", "neo-tree", "navic", "heirline" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`                                                      |
    day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors                                                  |
    hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**. |
    dim_inactive = true, -- dims inactive windows
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold|
    on_highlights = function(hl, c)
      local prompt = "#2d3149"
      hl.TelescopeNormal = {
        bg = c.bg_dark,
        fg = c.fg_dark,
      }
      hl.TelescopeBorder = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopePromptNormal = {
        bg = prompt,
      }
      hl.TelescopePromptBorder = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePromptTitle = {
        bg = prompt,
        fg = prompt,
      }
      hl.TelescopePreviewTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }
      hl.TelescopeResultsTitle = {
        bg = c.bg_dark,
        fg = c.bg_dark,
      }

      hl.TSRainbowRed = { link = "rainbowcol1" }
      hl.TSRainbowOrange = { link = "rainbowcol2" }
      hl.TSRainbowGreen = { link = "rainbowcol3" }
      hl.TSRainbowCyan = { link = "rainbowcol4" }
      hl.TSRainbowBlue = { link = "rainbowcol5" }
      hl.TSRainbowViolet = { link = "rainbowcol6" }
      hl.TSRainbowYellow = { link = "rainbowcol7" }
    end,
  },
}
