-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
	"AstroNvim/astrocommunity",
	{ import = "astrocommunity.pack.lua" },
	-- import/override with your plugins folder
	-- Packs
	{ import = "astrocommunity.pack.rust" },
	{ import = "astrocommunity.pack.python" },
	{ import = "astrocommunity.pack.go" },
	{ import = "astrocommunity.pack.html-css" },
	{ import = "astrocommunity.pack.markdown" },
	{ import = "astrocommunity.pack.python-ruff" },
	{ import = "astrocommunity.pack.tailwindcss" },
	{ import = "astrocommunity.pack.toml" },
	{ import = "astrocommunity.pack.typescript" },
	{ import = "astrocommunity.pack.yaml" },
	{ import = "astrocommunity.pack.json" },
	{ import = "astrocommunity.pack.php" },
	{ import = "astrocommunity.pack.astro" },

	-- LSP
	{ import = "astrocommunity.lsp.inc-rename-nvim" },
	{ import = "astrocommunity.lsp.lsp-signature-nvim" },
	{ import = "astrocommunity.lsp.lsp-inlayhints-nvim" },
	{ import = "astrocommunity.lsp.nvim-lsp-file-operations" },

	{ import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
	{ import = "astrocommunity.scrolling.cinnamon-nvim" },

	-- { import = "astrocommunity.workflow.hardtime-nvim" },

	{ import = "astrocommunity.completion.cmp-git" },
	{ import = "astrocommunity.completion.cmp-nerdfont" },
	{ import = "astrocommunity.completion.cmp-emoji" },
	{ import = "astrocommunity.completion.cmp-nvim-lua" },
	{ import = "astrocommunity.completion.cmp-tmux" },
	{ import = "astrocommunity.completion.cmp-calc" },
	{ import = "astrocommunity.completion.cmp-under-comparator" },
	{ import = "astrocommunity.completion.nvim-cmp-buffer-lines" },
	{ import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
	{ import = "astrocommunity.editing-support.multicursors-nvim" },
	{ import = "astrocommunity.indent.mini-indentscope" },

	{ import = "astrocommunity.motion.tabout-nvim" },

	-- Telescope
	{ import = "astrocommunity.utility.telescope-lazy-nvim" },
	{ import = "astrocommunity.utility.telescope-fzy-native-nvim" },
}
