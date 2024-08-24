return {
  "nvimdev/lspsaga.nvim",
  config = function() require("nvim.mainm.config.nvim.lua.user.lspsaga").setup {} end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- optional
    "nvim-tree/nvim-web-devicons", -- optional
  },
}
