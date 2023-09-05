local lc = require('lspconfig')

-- Initialize all lsp's handled by nvim-lsp-installer
require('lsp.nvim_lsp_installer_opts')

-- Global lsp options module
local lsp_options = require('lsp.global_lsp_options')
lsp_options.setup()
lc.clangd.setup({
})
-- look at :help lspconfig-setup
