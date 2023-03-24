local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_cmp_ok then
    M.capabilities = cmp_nvim_lsp.default_capabilities(M.capabilities)
end

M.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "",  texthl = "Error", },
        { name = "DiagnosticSignWarn",  text = "",  texthl = "Warn", },
        { name = "DiagnosticSignHint",  text = "󰌵", texthl = "Hint", },
        { name = "DiagnosticSignInfo",  text = "",  texthl = "Info", },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texth1 = sign.name, text = sign.text, texthl = sign.texthl, numh1 = "" })
    end

    local config = {
        virtual_text = false,
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = false,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }
    vim.diagnostic.config(config)
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local lsp_highlight_document = function(client)
    if client.resolved_capabilities.document_highlight then
        -- TODO Change `autogroup lsp_document_hightlight`; lsp_document_hightlight causes an error
        vim.api.nvim_exec(
            [[
            autogroup lsp_document_hightlight
            autocmd! * <buffer>
            autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.buf.clear_references()
            autogroup END
            ]], false
        )
    end
end

M.on_attach = function(client, _)
    if client.name == "sumneko_lua" then
        client.server_capabilities.documentFormattingProvider = false
    end

    local status_ok, illuminate = pcall(require, "illuminate")
    if status_ok then
        illuminate.on_attach(client)
    end
end

return M
