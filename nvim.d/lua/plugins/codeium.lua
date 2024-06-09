-- return {
--   "Exafunction/codeium.vim",
--   cmd = "Codeium",
--   init = function()
--     vim.g.codeium_enabled = 0
--     vim.g.codeium_disable_bindings = 1
--     vim.g.codeium_idle_delay = 1500
--     -- match function
--   end,
--   config = function()
--     vim.keymap.set("i", "<C-CR>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
--     vim.keymap.set("i", "<S-Left>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
--     vim.keymap.set("i", "<S-Right>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
--     vim.keymap.set("i", "<C-BS>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
--
--     vim.api.nvim_set_hl(0, "CodeiumSuggestion", { link = "Comment" })
--   end,
-- }
return {
  -- codeium cmp source
  {
    "nvim-cmp",
    dependencies = {
      -- codeium
      {
        "Exafunction/codeium.nvim",
        cmd = "Codeium",
        build = ":Codeium Auth",
        event = "User AstroFile",

        opts = {
          config = function()
            vim.keymap.set("i", "<C-CR>", function() return vim.fn["codeium#Accept"]() end, { expr = true })
            vim.keymap.set("i", "<c-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, { expr = true })
            vim.keymap.set("i", "<c-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, { expr = true })
            vim.keymap.set("i", "<c-x>", function() return vim.fn["codeium#Clear"]() end, { expr = true })
            vim.keymap.set("n", "<leader>;", function()
              if vim.g.codeium_enabled == true then
                vim.cmd "CodeiumDisable"
              else
                vim.cmd "CodeiumEnable"
              end
            end, { noremap = true, desc = "Toggle Codeium active" })
          end,
        },
      },
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, 1, {
        name = "codeium",
        group_index = 1,
        priority = 100,
      })
    end,
  },
}
