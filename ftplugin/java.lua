local config = {
    on_attach = function(_, _)
        local cmp = require('cmp')
        local cmp_opts = require('lsp.cmp_opts')
        cmp.setup(cmp_opts.cmp_opts)
    end,
    cmd = {'/home/atpan/.local/share/nvim/lsp_servers/jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
require('jdtls').start_or_attach(config)
