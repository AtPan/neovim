local kopts = { noremap = true }

--General Vim Keybinds{{{1
--Movement Keybinds{{{2
vim.api.nvim_set_keymap('n', '<leader>q', '0', kopts)
vim.api.nvim_set_keymap('v', '<leader>q', '0', kopts)
vim.api.nvim_set_keymap('n', '<leader>w', '^', kopts)
vim.api.nvim_set_keymap('v', '<leader>w', '^', kopts)
vim.api.nvim_set_keymap('n', '<leader>e', '$', kopts)
vim.api.nvim_set_keymap('v', '<leader>e', '$', kopts)
vim.api.nvim_set_keymap('v', '=', '+', kopts)

--Misc. Keybinds{{{2
vim.api.nvim_set_keymap('i', '<leader>dd', '<esc>ddO', kopts)
vim.api.nvim_set_keymap('n', '<leader>sv', ':source $MYVIMRC<cr>', kopts)
vim.api.nvim_set_keymap('n', '<leader>q`', ':wq!<cr>', kopts)
vim.api.nvim_set_keymap('v', '<leader>"', '<esc>a"<esc>gvo<esc>i"<esc>gvo"', kopts)

--Key Rebinds{{{2
vim.api.nvim_set_keymap('i', 'jj', '<esc>', kopts)
vim.api.nvim_set_keymap('v', 'jj', '<esc>', kopts)

-- Telescope and Tab Keybinds{{{1
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files<cr>', kopts)
vim.api.nvim_set_keymap('n', '<leader>gt', ':Telescope git_status<cr>', kopts)

-- Tab Keybinds{{{2
vim.api.nvim_set_keymap('n', '<leader>1', '1gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>2', '2gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>3', '3gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>4', '4gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>5', '5gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>6', '6gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>7', '7gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>8', '8gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>9', '9gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>t', 'gt', kopts)
vim.api.nvim_set_keymap('n', '<leader>T', 'gT', kopts)

--Bacon Keybinds{{{1
vim.api.nvim_set_keymap('n', '!', ':BaconLoad<cr>:w<cr>:BaconNext<cr>', kopts)
vim.api.nvim_set_keymap('n', '<leader>!', ':BaconList<cr>', kopts)

--LSP Keybings{{{1
local opts = { noremap = true, silent = true }
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        vim.g.updatetime = 300

        --[[
        vim.api.nvim_create_autocmd({ "CursorHold" }, {
            pattern = { "*" },
            command = [[lua vim.diagnostic.open_float(nil, { focusable = false })] ]
        })
        --]]

        local bufnr = args.buf
        local keymap = vim.api.nvim_buf_set_keymap

        keymap(bufnr, "n", "gD", '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        keymap(bufnr, "n", "gs", '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        keymap(bufnr, "n", "ge", "<cmd>lua vim.diagnostic.open_float(nil, { focusable = false })<cr>", opts)
        keymap(bufnr, "n", "K", '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<cr>', opts)
        keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<cr>', opts)
        keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
        keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
        --keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
        vim.cmd [[ command! Format execute 'lua vim.lsp.buf.format {async = true}' ]]
    end,
})
