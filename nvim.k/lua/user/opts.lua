-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true

vim.g.neovide_padding_top = 10
vim.g.neovide_scroll_animation_length = 0.25

vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
vim.g.neovide_cursor_vfx_particle_density = 15

vim.opt.cursorline = false
vim.opt.cursorcolumn = false

vim.g.neovide_hide_mouse_when_typing = true

vim.g.neovide_refresh_rate = 60
vim.g.neovide_refresh_rate_idle = 5

vim.g.neovide_floating_shadow = true
vim.g.neovide_floating_z_height = 3
vim.g.neovide_light_angle_degrees = 15
vim.g.neovide_light_radius = 25

vim.g.blend = (vim.g.neovide and 0) or (vim.env.WEZTERM and 3) or 0
vim.g.border = "none_cmp_fix"

-- vim.opt.guifont = "VictorMono_Nerd_Font,Symbols_Nerd_Font:h13.5:#e-subpixelantialias:#h-full"
-- vim.opt.guifont =
--   "VictorMono_Nerd_Font_medium,Symbols_Nerd_Font:h13.5:m:#e-subpixelantialias:#h-full"

vim.opt.foldcolumn = "0"
vim.opt.autoread = true
vim.opt.winwidth = 10
vim.opt.winminwidth = 10
vim.opt.equalalways = true
vim.opt.winblend = vim.g.blend
vim.opt.pumblend = vim.g.blend
vim.o.winblend = vim.g.blend
vim.o.pumblend = vim.g.blend
vim.opt.shell = vim.fn.executable("pwsh") and "pwsh" or "powershell"
vim.opt.shellxquote = ""
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
vim.opt.shellquote = ""
vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
