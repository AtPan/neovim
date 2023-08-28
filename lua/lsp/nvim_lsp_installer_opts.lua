local lsp_installer_status, lspi = pcall(require, 'nvim-lsp-installer')
if not lsp_installer_status then
    return
end

local global_lsp_options = require('lsp.global_lsp_options')

lspi.setup{}
--[[
lspi.on_server_ready(function(server)
    local opts = {
        on_attach = global_lsp_options.on_attach,
        capabilities = global_lsp_options.capabilities,
    }

    server:setup(opts)
end)
--]]
