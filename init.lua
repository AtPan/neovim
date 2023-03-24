require('plugins.nvim_packer')
require('lsp')
require('config')
require('note')
require('colorscheme')

if vim.fn.exists("neovide") == 1 then
	require('plugins.neovide')
end
