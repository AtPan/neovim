require('config.keymaps')

vim.api.nvim_create_autocmd({ "BufRead" }, {
    pattern = {
        "*.c",
        "*.cpp",
        "*.asm",
        "*.rs",
        "*.js",
        "*.py",
        "*.cs",
        "*.java",
        "*.sh",
        "*.ada",
        "*.pl",
        "*.json",
        "*.php",
        "*.zsh",
        "*.vim",
        "*.lua",
    },
    command = [[call rainbow#load()]]
})

vim.api.nvim_create_autocmd({ "BufRead", "BufWrite" }, {
    pattern = { "*.md" },
    command = [[setlocal ft=markdown]],
})

vim.cmd [[syntax enable]]

vim.o.number = true
vim.o.encoding = "utf-8"
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.termguicolors = true
