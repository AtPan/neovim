vim.g.mapleader = ","

vim.o.relativenumber = true
vim.o.foldmethod = 'marker'

-- Text Wrapping
vim.opt.textwidth = 0
vim.wo.wrap = false

require('config.keymaps')
require('config.folds')
require('config.vim')
