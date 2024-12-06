return {

  {
  "max397574/better-escape.nvim",
  opts = {},
},
    -- tabout
{
  "abecodes/tabout.nvim",
  event = "InsertEnter",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  specs = {
    {
      "hrsh7th/nvim-cmp",
      optional = true,
      opts = function(_, opts)
        local cmp = require "cmp"
        local snippet_jumpable = function() return vim.snippet and vim.snippet.active { direction = 1 } end
        local snippet_jump = vim.schedule_wrap(function() vim.snippet.jump(1) end)
        local luasnip_avail, luasnip = pcall(require, "luasnip")
        if luasnip_avail then
          snippet_jumpable = luasnip.expand_or_jumpable
          snippet_jump = luasnip.expand_or_jump
        end
        opts.mapping["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.api.nvim_get_mode() ~= "c" and snippet_jumpable() then
            snippet_jump()
          elseif not luasnip_avail and pcall(vim.snippet.active, { direction = 1 }) then
            vim.snippet.jump(1)
          else
            fallback()
          end
        end, { "i", "s" })
      end,
    },
  },
  opts = {},
},
-- cmp-cmdline
{
  "hrsh7th/cmp-cmdline",
  keys = { ":", "/", "?" }, -- lazy load cmp on more keys along with insert mode
  dependencies = { "hrsh7th/nvim-cmp" },
  opts = function()
    local cmp = require "cmp"
    return {
      {
        type = "/",
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      },
      {
        type = ":",
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      },
    }
  end,
  config = function(_, opts)
    local cmp = require "cmp"
    vim.tbl_map(function(val) cmp.setup.cmdline(val.type, val) end, opts)
  end,
},
-- noice
{
	"folke/noice.nvim",
	-- event = "VeryLazy",
	-- enabled = true,
	-- opts = {
	-- 	-- add any options here
	-- },
	-- dependencies = {
	-- 	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 	"MunifTanjim/nui.nvim",
	-- 	-- OPTIONAL:
	-- 	--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 	--   If not available, we use `mini` as the fallback
	-- 	-- "rcarriga/nvim-notify",
	-- },

	config = function()
		require("noice").setup({
			views = {
				cmdline_popup = {
					position = {
						row = 20,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
				},
				popupmenu = {
					relative = "editor",
					position = {
						row = 8,
						col = "50%",
					},
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
					},
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						kind = "",
						find = "written",
					},
					opts = { skip = true },
				},
			},
			-- routes = {
			--   {
			--     view = "notify",
			--     filter = { event = "msg_showmode" },
			--   },
			-- },
			-- lsp = {
			-- 	Progress = {
			-- 		enabled = true,
			-- 		-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
			-- 		-- See the section on formatting for more details on how to customize.
			-- 		--- @type NoiceFormat|string
			-- 		format = "lsp_progress",
			-- 		--- @type NoiceFormat|string
			-- 		format_done = "lsp_progress_done",
			-- 		throttle = 1000 / 30, -- frequency to update lsp progress message
			-- 		view = "mini",
			-- 	},
			-- 	override = {
			-- 		["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			-- 		["vim.lsp.util.stylize_markdown"] = true,
			-- 		["cmp.entry.get_documentation"] = true,
			-- 	},
			-- },
			-- you can enable a preset for easier configuration
			-- presets = {
			--     bottom_search = true,         -- use a classic bottom cmdline for search
			--     command_palette = true,       -- position the cmdline and popupmenu together
			--     long_message_to_split = true, -- long messages will be sent to a split
			--     inc_rename = false,           -- enables an input dialog for inc-rename.nvim
			--     lsp_doc_border = true,        -- add a border to hover docs and signature help
			-- },
			-- cmdline = {
			-- 	view = "cmdline",
			-- },
			mini = {
				win_options = {
					winblend = 0,
				},
			},
		})
	end,
}


  }