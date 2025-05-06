local M = {}

local find_root_dir = function(wd)
    return vim.fs.dirname(vim.fs.find({'build.zig', 'src'}, {upward = true, path=wd})[1])
end

M = {
    name = 'zls',
    cmd = {'/home/atpan/.zig/zls'},
    on_attach = function(client, bufnr)
        local cmp = require('cmp')
        local cmp_opts = require('lsp.cmp_opts')
        cmp.setup(cmp_opts.cmp_opts)

        vim.g.zig_fmt_autosave = 0

        vim.api.nvim_set_hl(0, '@lsp.type.builtin.zig', {
            fg = '#ff9e64',
            bold = true,
        })
        vim.api.nvim_set_hl(0, 'zigVarDecl', {
            bold = false,
        })
    end,
}

return M
