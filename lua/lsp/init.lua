local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
    return
end

-- Global lsp options module
local lsp_options = require('lsp.lsp_options')
lsp_options.setup()

-- Initializes lua-language-server, originally sumneko_lua
lspconfig.lua_ls.setup({
    settings = require('lsp.sumneko_lua').settings,
    on_attach = lsp_options.on_attach,
    capabilities = lsp_options.capabilities,
})

-- Initializes rust-analyzer
lspconfig.rust_analyzer.setup({
    --settings = require('lsp.rust_analyzer').settings,
    server = require('lsp.rust_analyzer').server,
    tools = require('lsp.rust_analyzer').tools,
    on_attach = lsp_options.on_attach,
    capabilities = lsp_options.capabilities,
})

-- Handles all lsp_installer servers
require('lsp.lsp_installer')

-- Sets up autocompletion
require('lsp.lsp_cmp')
