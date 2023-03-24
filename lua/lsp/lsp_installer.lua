local status_ok, lsp_installer = pcall(require, 'nvim-lsp-installer')
if not status_ok then
    return
end

-- For managing lsp's installed through nvim-lsp-installer

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require('lsp.lsp_options').on_attach,
        capabilities = require('lsp.lsp_options').capabilities,
    }

    server:setup(opts)
end)
