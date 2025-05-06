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
        virtual_text = {
            severity = {
                vim.diagnostic.severity.ERROR,
            },
            prefix = string.format('%s ', signs[1].text),
        },
        signs = true,
        severity_sort = true,
        update_in_insert = true,
        float = {
            focusable = false,
            source = false,
            severity_sort = true,
            border = "double",
            header = "",
            prefix = "",
            suffix = "",
            format = function(diagnostic)
                local sign = ""
                if diagnostic.severity == vim.diagnostic.severity.ERROR then
                    sign = signs[1].text
                elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                    sign = signs[2].text
                elseif diagnostic.severity == vim.diagnostic.severity.INFO then
                    sign = signs[3].text
                else
                    sign = signs[4].text
                end
                return string.format('%s    %s', sign, diagnostic.message)
            end,
        },
    })

    vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
        callback = function(args)
            vim.lsp.buf.document_highlight()
        end,
    })

    vim.api.nvim_create_autocmd("CursorMoved", {
        callback = function(args)
            vim.lsp.buf.clear_references()
        end,
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
