vim.opt.list = true
vim.opt.listchars:append("space:⋅")

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {
    indent = {
      char = "│",
    },
    scope = {
      enabled = false,
    },
    exclude = {
      filetypes = { "help", "alpha", "dashboard", "Trouble", "lazy", "neo-tree" },
    },
    whitespace = {
      remove_blankline_trail = true,
    },
  },
}
