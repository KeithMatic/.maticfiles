return {
  "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  cmd = "Neotree",
  keys = {
    {
      "<leader>fo",
      function()
        require("neo-tree.command").execute({ dir = vim.loop.cwd() })
      end,
      desc = "NeoTree focus (cwd)",
    },
    { "<leader>o", "<leader>fo", desc = "Explorer NeoTree Focus (cwd)", remap = true },
  },
  opts = {
    position = "right",
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = true,
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        ignore_patterns = {},
      },
    },
    window = {
      width = 30,
      mappings = {
        -- ["<space>"] = "none",
        ["Cr"] = "open",
        ["<space>"] = false, -- disable space until we figure out which-key disabling
        ["[b"] = "prev_source",
        ["]b"] = "next_source",
        ["o"] = "open",
        ["h"] = "close_node",
        ["l"] = "open",
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
    },
  },
}

