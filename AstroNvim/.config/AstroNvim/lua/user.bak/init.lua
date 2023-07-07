vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function() _G.THEME = require("user.util.theme").setup() end,
})

return {
  -- add new user interface icon
  icons = {
    VimIcon = "",
    ScrollText = "",
    GitBranch = "",
    GitAdd = "",
    GitChange = "",
    GitDelete = "",
  },
}
