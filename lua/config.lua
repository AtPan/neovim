-- Vim Options
vim.g.mapleader = ","

vim.o.relativenumber = true
vim.wo.wrap = false
vim.o.number = true
vim.o.encoding = 'utf-8'
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.termguicolors = true
vim.o.updatetime = 300

-- Vim Commands
--vim.cmd [[syntax enable]]

-- Vim Folds
vim.o.foldmethod = 'marker'
vim.opt.foldcolumn = '2'

-- Vim Autocmds
vim.api.nvim_create_autocmd('BufWritePost', {
        callback = function(args)
            vim.cmd [[mkview]]
        end,
    })
vim.api.nvim_create_autocmd('FileWritePost', {
        callback = function(args)
            vim.cmd [[mkview]]
        end,
    })
vim.api.nvim_create_autocmd('BufReadPost', {
        callback = function(args)
            vim.cmd [[silent! loadview]]
        end,
    })
vim.api.nvim_create_autocmd('FileReadPost', {
        callback = function(args)
            vim.cmd [[silent! loadview]]
        end,
    })


-- Neovide Options
if vim.g.neovide then
    local telescope_installed, telescope = pcall(require, 'telescope')
    if telescope_installed then
        telescope.setup{
            defaults = {
                winblend = 50,
                file_ignore_patterns = {
                    '%.o',
                    '%.ttf',
                    '%.otf',
                    '%.png',
                    '%.jpeg',
                    '%.jpg',
                    '%.pdf',
                    '%.class',
                    'node_modules/'
                },
            }
        }
    end

    vim.o.guifont = "FiraMono Nerd Font:h10:#e-subpixelantialias:#h-normal"

    vim.g.neovide_scale_factor = 1.0
    vim.api.nvim_set_keymap('n', '<C-Up>', '<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.04<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<C-Down>', '<cmd>lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.04<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<C-S-Up>', '<cmd>lua vim.g.neovide_scale_factor = 1.0<cr>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<C-S-Down>', '<cmd>lua vim.g.neovide_scale_factor = 1.0<cr>', { noremap = true })

    vim.g.neovide_floating_shadow = true
    vim.g.neovide_floating_z_height = 10
    vim.g.neovide_light_angle_degrees = 45
    vim.g.neovide_light_radius = 10

    vim.g.neovide_hide_mouse_when_typing = true

    vim.g.neovide_underline_stroke_scale = 1.5

    vim.g.neovide_cursor_smooth_blink = true
end

-- NVim Keybinds
local vkopts = { noremap = true } -- Vim Keymap OPTionS

-- Normal Mode
vim.api.nvim_set_keymap('n', '<leader>vkm', '<cmd>tabnew ~/.config/nvim/lua/config.lua<cr>', vkopts)

vim.api.nvim_set_keymap('n', '<leader>q', '0', vkopts)
vim.api.nvim_set_keymap('n', '<leader>w', '^', vkopts)
vim.api.nvim_set_keymap('n', '<leader>e', '$', vkopts)
--vim.api.nvim_set_keymap('n', '<leader>vq', '<cmd>wq!<cr>', vkopts)
vim.api.nvim_set_keymap('n', '<leader>qq', '<cmd>wq<cr>', vkopts)
vim.api.nvim_set_keymap('n', '<leader><ESC>', '<cmd>q<cr>', vkopts)
vim.api.nvim_set_keymap('n', '<leader>vh', '<cmd>noh<cr>', vkopts)

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', vkopts)
vim.api.nvim_set_keymap('n', '<leader>gst', '<cmd>Telescope git_status<cr>', vkopts)

vim.api.nvim_set_keymap('n', '<leader>ee', '<cmd>Execute<cr>', vkopts)

vim.api.nvim_set_keymap('n', '1t', '1gt', vkopts)
vim.api.nvim_set_keymap('n', '2t', '2gt', vkopts)
vim.api.nvim_set_keymap('n', '3t', '3gt', vkopts)
vim.api.nvim_set_keymap('n', '4t', '4gt', vkopts)
vim.api.nvim_set_keymap('n', '5t', '5gt', vkopts)
vim.api.nvim_set_keymap('n', '6t', '6gt', vkopts)
vim.api.nvim_set_keymap('n', '7t', '7gt', vkopts)
vim.api.nvim_set_keymap('n', '8t', '8gt', vkopts)
vim.api.nvim_set_keymap('n', '9t', '9gt', vkopts)

-- zo - Opens one level of the selected fold
-- zc - Closes one level of the selected fold
-- za - Toggles one level of the selected fold
vim.api.nvim_set_keymap('n', 'zro', 'zr', vkopts) -- Opens one level of all folds
vim.api.nvim_set_keymap('n', 'zrc', 'zm', vkopts) -- Closes one level of all folds
vim.api.nvim_set_keymap('n', 'Zro', 'zR', vkopts) -- Opens all levels of all folds
vim.api.nvim_set_keymap('n', 'Zrc', 'zM', vkopts) -- Closes all levels of all folds

-- Insert Mode
vim.api.nvim_set_keymap('i', 'jj', '<esc>', vkopts)
vim.api.nvim_set_keymap('i', '<leader>dd', '<esc>ddO', vkopts)
vim.api.nvim_set_keymap('i', '<leader><ESC>', '<cmd>q<cr>', vkopts)

-- Visual Mode
vim.api.nvim_set_keymap('v', '<leader>"', '<esc>a"<esc>gvo<esc>i"<esc>gvo"', vkopts)
vim.api.nvim_set_keymap('v', '=', '+', vkopts)

vim.o.winblend = 30

-- Global LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.g.updatetime = 300

        local bnr = args.buf
        local lspopt = { noremap = true, silent = true }
        
        vim.api.nvim_buf_set_keymap(bnr, "n", "<leader>cr", "<cmd>lua vim.lsp.buf.references()<cr>", lspopt)
        vim.api.nvim_buf_set_keymap(bnr, "n", "<leader>cn", "<cmd>lua vim.lsp.buf.rename()<cr>", lspopt)
        vim.api.nvim_buf_set_keymap(bnr, "n", "D", "<cmd>tab split | lua vim.lsp.buf.definition()<cr>", lspopt)
        vim.api.nvim_buf_set_keymap(bnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", lspopt)
        vim.api.nvim_buf_set_keymap(bnr, "n", "L", "<cmd>lua vim.diagnostic.open_float()<cr>", lspopt)
        vim.api.nvim_buf_set_keymap(bnr, "n", "<leader>gn", "<cmd>lua vim.diagnostic.get_next()<cr>", lspopt)
        vim.api.nvim_buf_set_keymap(bnr, "n", "<leader>gp", "<cmd>lua vim.diagnostic.get_prev()<cr>", lspopt)

        vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format({ async = true })' ]]
    end,
    })

local cmp = require('cmp')
-- Exports for mappings needed in other files and methods
local scroll_next_item = function(fallback)
    if cmp.visible() then
        cmp.select_next_item()
    else
        fallback()
    end
end

local scroll_prev_item = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    else
        fallback()
    end
end

local keymaps = {
    cmp_keymaps = {
        ['<Tab>'] = cmp.mapping(scroll_next_item, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(scroll_prev_item, { 'i', 's' }),
        ['<CR>'] = cmp.mapping.confirm { select = true },
        ['<C-j>'] = cmp.mapping(cmp.mapping.scroll_docs(1), { 'i', 'c', }),
        ['<C-k>'] = cmp.mapping(cmp.mapping.scroll_docs(-1), { 'i', 'c', }),
    },

    rust_analyzer_keymaps = function(bufnr)
        vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>re', '<cmd>RustRun<cr>', {noremap = true})
    end,
}

return keymaps
