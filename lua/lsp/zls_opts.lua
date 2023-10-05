
local M = {}

M.opts = {
    on_attach = function(client, bufnr)
        local cmp = require('cmp')
        local cmp_opts = require('lsp.cmp_opts')
        cmp.setup(cmp_opts.cmp_opts)
    end,
}

return M
