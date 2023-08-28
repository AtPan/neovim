local opts = {}

opts.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "",  texthl = "Error", },
        { name = "DiagnosticSignWarn",  text = "",  texthl = "Warn", },
        { name = "DiagnosticSignHint",  text = "󰌵", texthl = "Hint", },
        { name = "DiagnosticSignInfo",  text = "",  texthl = "Info", },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texth1 = sign.name, text = sign.text, texthl = sign.texthl, numh1 = "" })
    end

    --[[
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
    --]]
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })
    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

return opts
