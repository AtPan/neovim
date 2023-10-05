local opts = {}

opts.capabilities = vim.lsp.protocol.make_client_capabilities()
opts.capabilities.textDocument.completion.completionItem.snippetSupport = true

opts.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "",  texthl = "DiagnosticSignError", },
        { name = "DiagnosticSignWarn",  text = "",  texthl = "DiagnosticSignWarn", },
        { name = "DiagnosticSignHint",  text = "󰌵", texthl = "DiagnosticSignHint", },
        { name = "DiagnosticSignInfo",  text = "",  texthl = "DiagnosticSignInfo", },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texth1 = sign.name, text = sign.text, texthl = sign.texthl, numh1 = "" })
    end

    -- Alter how vim diagnostics operate
    vim.diagnostic.config({
        underline = true,
        virtual_text = false,
        signs = true,
        severity_sort = true,
        update_in_insert = true,
        float = {
            focusable = false,
            source = false,
            border = "rounded",
            header = "",
            prefix = "",
        },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
        focusable = false,
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
        focusable = false,
    })
end

return opts
