local M = {
  "SmiteshP/nvim-navic",
}

function M.config()
  local icons = require "nvim.mainm.config.nvim.lua.user.util.icons"
  require("nvim-navic").setup {
    icons = icons.ui,
    highlight = true,
    lsp = {
      auto_attach = true,
    },
    click = true,
    separator = " " .. icons.ui.ChevronRight .. " ",
    depth_limit = 0,
    depth_limit_indicator = "..",
  }
end

return M