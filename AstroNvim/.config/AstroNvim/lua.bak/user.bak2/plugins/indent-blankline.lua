vim.opt.list = true
vim.opt.listchars:append "space:⋅"

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "User AstroFile",
  opts = {
    char = "│",
    filetype_exclude = { "help", "alpha", "dashboard", "neo-tree", "Trouble", "lazy" },
    show_trailing_blankline_indent = false,
    show_current_context = true,
  },
}
