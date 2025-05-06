local lsp_installer_status, lspi = pcall(require, 'nvim-lsp-installer')
if not lsp_installer_status then
    return
end

local global_lsp_options = require('lsp.global_lsp_options')

lspi.setup()
