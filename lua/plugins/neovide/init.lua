-- Cursor VFX Settings
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_cursor_vfx_particle_speed = 11.0
vim.g.neovide_cursor_vfx_particle_phase = 1.8
vim.g.neovide_cursor_vfx_particle_curl = 0.7

-- Screen Settings
vim.g.refresh_rate = 60
vim.g.neovide_fullscreen = true
vim.g.neovide_refresh_rate_idle = 5
vim.g.neovide_transparency = 1.0

-- Font Settings
vim.opt.guifont = { "FuraMono Nerd Font", ":h11" }

-- Neovide-Specific Keybinds
vim.api.nvim_set_keymap('n', '<leader>n=', '<cmd>lua vim.g.neovide_transparency = vim.g.neovide_transparency + 0.01<cr>',
    { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>n-', '<cmd>lua vim.g.neovide_transparency = vim.g.neovide_transparency - 0.01<cr>',
    { noremap = true, silent = true})
