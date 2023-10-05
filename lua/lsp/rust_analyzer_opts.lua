local rust_opts = {
    tools = {
        inlay_hints = {
          auto = true,
          show_parameter_hints = false,
          parameter_hints_prefix = "",
          other_hints_prefix = "",
        },
        runnables = {
            use_telescope = true,
        },
    },

    server = {
        on_attach = function(client, bufnr)
            -- Setup rust-specific keymaps
            require('config').rust_analyzer_keymaps(bufnr)

            -- Setup cmp
            local cmp = require('cmp')
            local cmp_opts = require('lsp.cmp_opts')
            cmp.setup(cmp_opts.cmp_opts)
        end,

        settings = {
            ['rust-analyzer'] = {
                checkOnSave = {
                    command = "clippy",
                },
            },
        },
    },
}

return rust_opts
