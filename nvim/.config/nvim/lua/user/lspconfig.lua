-- local M = {
--   "neovim/nvim-lspconfig",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     {
--       "folke/neodev.nvim",
--       -- Autocompletion
--     { "hrsh7th/nvim-cmp" }, -- Required
--     { "hrsh7th/cmp-nvim-lsp" }, -- Required
--     { "L3MON4D3/LuaSnip" }, -- Required
--     { "rafamadriz/friendly-snippets" },
--     { "hrsh7th/cmp-buffer" },
--     { "hrsh7th/cmp-path" },
--     { "hrsh7th/cmp-cmdline" },
--     { "saadparwaiz1/cmp_luasnip" },
--     },
--   },
-- }

-- local function lsp_keymaps(bufnr)
--   local opts = { noremap = true, silent = true }
--   local keymap = vim.api.nvim_buf_set_keymap
--   keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--   keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--   keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--   keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--   keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--   keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
-- end

-- M.on_attach = function(client, bufnr)
--   lsp_keymaps(bufnr)

--   if client.supports_method "textDocument/inlayHint" then
--     vim.lsp.inlay_hint.enable(bufnr, true)
--   end
-- end

-- function M.common_capabilities()
--   local capabilities = vim.lsp.protocol.make_client_capabilities()
--   capabilities.textDocument.completion.completionItem.snippetSupport = true
--   return capabilities
-- end

-- M.toggle_inlay_hints = function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.lsp.inlay_hint.enable(bufnr, not vim.lsp.inlay_hint.is_enabled(bufnr))
-- end

-- function M.config()
--   local wk = require "which-key"
--   wk.register {
--     ["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--     ["<leader>lf"] = {
--       "<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
--       "Format",
--     },
--     ["<leader>li"] = { "<cmd>LspInfo<cr>", "Info" },
--     ["<leader>lj"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic" },
--     ["<leader>lh"] = { "<cmd>lua require('user.lspconfig').toggle_inlay_hints()<cr>", "Hints" },
--     ["<leader>lk"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
--     ["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--     ["<leader>lq"] = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
--     ["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--   }

--   wk.register {
--     ["<leader>la"] = {
--       name = "LSP",
--       a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
--     },
--   }

--   local lspconfig = require "lspconfig"
--   local icons = require "user.icons"

--   local servers = {
--     "lua_ls",
--     "cssls",
--     "html",
--     "tsserver",
--     "eslint",
--     "tsserver",
--     "pyright",
--     "bashls",
--     "jsonls",
--     "yamlls",
--   }

--   local default_diagnostic_config = {
--     signs = {
--       active = true,
--       values = {
--         { name = "DiagnosticSignError", text = icons.diagnostics.Error },
--         { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
--         { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
--         { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
--       },
--     },
--     virtual_text = false,
--     update_in_insert = false,
--     underline = true,
--     severity_sort = true,
--     float = {
--       focusable = true,
--       style = "minimal",
--       border = "rounded",
--       source = "always",
--       header = "",
--       prefix = "",
--     },
--   }

--   vim.diagnostic.config(default_diagnostic_config)

--   for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
--     vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
--   end

--   vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
--   vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
--   require("lspconfig.ui.windows").default_options.border = "rounded"

--   for _, server in pairs(servers) do
--     local opts = {
--       on_attach = M.on_attach,
--       capabilities = M.common_capabilities(),
--     }

--     local require_ok, settings = pcall(require, "user.lspsettings." .. server)
--     if require_ok then
--       opts = vim.tbl_deep_extend("force", settings, opts)
--     end

--     if server == "lua_ls" then
--       require("neodev").setup {}
--     end

--     lspconfig[server].setup(opts)
--   end
-- end

-- return M
return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v2.x",
	dependencies = {
		-- LSP Support
		{ "neovim/nvim-lspconfig" }, -- Required
		{ -- Optional
			"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end,
		},
		{ "williamboman/mason-lspconfig.nvim" }, -- Optional

		-- Autocompletion
		{ "hrsh7th/nvim-cmp" }, -- Required
		{ "hrsh7th/cmp-nvim-lsp" }, -- Required
		{ "L3MON4D3/LuaSnip" }, -- Required
		{ "rafamadriz/friendly-snippets" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
		{ "saadparwaiz1/cmp_luasnip" },
	},
	config = function()
		local lsp = require("lsp-zero")

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }

			vim.keymap.set("n", "gr", function()
				vim.lsp.buf.references()
			end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" }))
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" }))
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" }))
			vim.keymap.set("n", "<leader>vws", function()
				vim.lsp.buf.workspace_symbol()
			end, vim.tbl_deep_extend("force", opts, { desc = "LSP Workspace Symbol" }))
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.setloclist()
			end, vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" }))
			vim.keymap.set("n", "[d", function()
				vim.diagnostic.goto_next()
			end, vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" }))
			vim.keymap.set("n", "]d", function()
				vim.diagnostic.goto_prev()
			end, vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" }))
			vim.keymap.set("n", "<leader>vca", function()
				vim.lsp.buf.code_action()
			end, vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" }))
			vim.keymap.set("n", "<leader>vrr", function()
				vim.lsp.buf.references()
			end, vim.tbl_deep_extend("force", opts, { desc = "LSP References" }))
			vim.keymap.set("n", "<leader>vrn", function()
				vim.lsp.buf.rename()
			end, vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" }))
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" }))
		end)

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = {
				"tsserver",
				"eslint",
				"rust_analyzer",
				"kotlin_language_server",
				"jdtls",
				"lua_ls",
				"jsonls",
				"html",
				"elixirls",
				"tailwindcss",
				"tflint",
				"pylsp",
				"dockerls",
				"bashls",
				"marksman",
				"solargraph",
				"cucumber_language_server",
			},
			handlers = {
				lsp.default_setup,
				lua_ls = function()
					local lua_opts = lsp.nvim_lua_ls()
					require("lspconfig").lua_ls.setup(lua_opts)
				end,
			},
		})

		local cmp_action = require("lsp-zero").cmp_action()
		local cmp = require("cmp")
		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		require("luasnip.loaders.from_vscode").lazy_load()

		-- `/` cmdline setup.
		cmp.setup.cmdline("/", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = "buffer" },
			},
		})

		-- `:` cmdline setup.
		cmp.setup.cmdline(":", {
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
		})

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "buffer", keyword_length = 3 },
				{ name = "path" },
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),
				["<Tab>"] = cmp_action.luasnip_supertab(),
				["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
			}),
		})
	end,
}
