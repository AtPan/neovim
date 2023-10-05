--vim.opt.completeopt = "menu,menuone,noinsert"
--vim.g.updatetime = 300
local lc = require('lspconfig')

-- Initialize all lsp's handled by nvim-lsp-installer
require('lsp.nvim_lsp_installer_opts')

-- Global lsp options module
local lsp_options = require('lsp.global_lsp_options')
lsp_options.setup()

-- Cmp auto-complete options
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
local cmp_opts = require('lsp.cmp_opts')
lsp_options.capabilities = cmp_opts.make_server_capabilities_with_cmp(lsp_options.capabilities)

-- Clangd lsp options
clangd_opts = require('lsp.clangd_opts')
clangd_opts.capabilities = lsp_options.capabilities
lc.clangd.setup(clangd_opts.opts)

-- Hls lsp options
hls_opts = require('lsp.hls_opts')
hls_opts.capabilities = lsp_options.capabilities
lc.hls.setup(hls_opts.opts)

-- rust_tools will setup, configure, and enable rust_analyzer for us. We just need to configure rust_tools
local rust_tools = require('rust-tools')
local rust_analyzer_opts = require('lsp.rust_analyzer_opts')
rust_analyzer_opts.server.capabilities = lsp_options.capabilities
rust_tools.setup(rust_analyzer_opts)

local zls_opts = require('lsp.zls_opts')
zls_opts.capabilities = lsp_options.capabilities
lc.zls.setup(zls_opts.opts)

-- look at :help lspconfig-setup
-- goal: if error or warning, display on left side and show details when hovered
