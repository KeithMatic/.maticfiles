-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder
  { import = "astrocommunity.pack.lua" },
  -- packs
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.python" },
  -- { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python-ruff" },
  -- { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.cmake" },
  -- { import = "astrocommunity.pack.astro" },
  -- { import = "astrocommunity.pack.ansible" },
  { import = "astrocommunity.pack.bash" },
  -- -- syntax
  { import = "astrocommunity.syntax.hlargs-nvim" },
  -- -- lsp
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  -- -- editing -support
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  -- -- terminal
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  -- scrolling
  { import = "astrocommunity.scrolling.cinnamon-nvim" },
  -- indent
  { import = "astrocommunity.indent.indent-blankline-nvim" },
  { import = "astrocommunity.indent.mini-indentscope" },
  -- telescope
  -- { import = "astrocommunity.telescope.telescope-fzf-native.nvim" },
  -- lsp
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  -- recipes
  -- { import = "astrocommunity.recipes.heirline-clock-statusline" },
  -- { import = "astrocommunity.recipes.heirline-mode-text-statusline" },
  -- { import = "astrocommunity.recipes.heirline-nvchad-statusline" },
  { import = "astrocommunity.recipes.vscode-icons" },
}
