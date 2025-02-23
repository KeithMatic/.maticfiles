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
vim.opt.shell = vim.fn.executable "pwsh" and "pwsh" or "powershell"
vim.opt.shellxquote = ""
vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
vim.opt.shellquote = ""
vim.opt.shellpipe = "| Out-File -Encoding UTF8 %s"
vim.opt.shellredir = "| Out-File -Encoding UTF8 %s"
