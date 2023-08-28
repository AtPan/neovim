-- Vim Options
vim.g.mapleader = ","
vim.o.relativenumber = true
--vim.opt.textwidth = 8
vim.wo.wrap = false
vim.o.number = true
vim.o.encoding = 'utf-8'
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.termguicolors = true

-- Vim Commands
vim.cmd [[syntax enable]]

-- NVim Keybinds
local vkopts = { noremap = true } -- Vim Keymap OPTionS

-- Normal Mode
vim.api.nvim_set_keymap('n', '<leader>q', '0', vkopts)
vim.api.nvim_set_keymap('n', '<leader>w', '^', vkopts)
vim.api.nvim_set_keymap('n', '<leader>e', '$', vkopts)
vim.api.nvim_set_keymap('n', '<leader>vq', '<cmd>wq!<cr>', vkopts)
vim.api.nvim_set_keymap('n', '<leader>vh', '<cmd>noh<cr>', vkopts)

vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', vkopts)
vim.api.nvim_set_keymap('n', '<leader>gst', '<cmd>Telescope git_status<cr>', vkopts)

vim.api.nvim_set_keymap('n', 't1', '1gt', vkopts)
vim.api.nvim_set_keymap('n', 't2', '2gt', vkopts)
vim.api.nvim_set_keymap('n', 't3', '3gt', vkopts)
vim.api.nvim_set_keymap('n', 't4', '4gt', vkopts)
vim.api.nvim_set_keymap('n', 't5', '5gt', vkopts)
vim.api.nvim_set_keymap('n', 't6', '6gt', vkopts)
vim.api.nvim_set_keymap('n', 't7', '7gt', vkopts)
vim.api.nvim_set_keymap('n', 't8', '8gt', vkopts)
vim.api.nvim_set_keymap('n', 't9', '9gt', vkopts)

-- zo - Opens one level of the selected fold
-- zc - Closes one level of the selected fold
vim.api.nvim_set_keymap('n', '<leader><space>', 'za', vkopts) -- Toggles the selected fold
vim.api.nvim_set_keymap('n', 'zro', 'zr', vkopts) -- Opens one level of all folds
vim.api.nvim_set_keymap('n', 'zrc', 'zm', vkopts) -- Closes one level of all folds
vim.api.nvim_set_keymap('n', 'Zro', 'zR', vkopts) -- Opens all levels of all folds
vim.api.nvim_set_keymap('n', 'Zrc', 'zM', vkopts) -- Closes all levels of all folds

-- Insert Mode
vim.api.nvim_set_keymap('i', 'jj', '<esc>', vkopts)
vim.api.nvim_set_keymap('i', '<leader>dd', '<esc>ddO', vkopts)

-- Visual Mode
vim.api.nvim_set_keymap('v', '<leader>"', '<esc>a"<esc>gvo<esc>i"<esc>gvo"', vkopts)
vim.api.nvim_set_keymap('v', '=', '+', vkopts)

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.g.updatetime = 300

        local bnr = args.buf

    end,
    })

-- Misc.

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

-- Fold colorscheme is controled by Foldedguifg
