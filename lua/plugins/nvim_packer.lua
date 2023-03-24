local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
        -- Packer will manage itself
        use 'wbthomason/packer.nvim'

        use 'L3MON4D3/LuaSnip'
        use 'folke/tokyonight.nvim'
        use 'drewtempelmeyer/palenight.vim'
        use 'RRethy/vim-illuminate'
        use 'vim-syntastic/syntastic'
        use 'ntpeters/vim-better-whitespace'
        use 'vim-airline/vim-airline'
        use 'wlangstroth/vim-racket'
        use 'sheerun/vim-polyglot'
        use 'preservim/tagbar'
        use 'universal-ctags/ctags'
        use 'frazrepo/vim-rainbow'
        use 'itchyny/lightline.vim'
        use 'tpope/vim-surround'
        use 'tommcdo/vim-lion'
        use 'shirk/vim-gas'
        use 'nvim-lua/popup.nvim'
        use 'nvim-lua/plenary.nvim'
        use 'nvim-telescope/telescope-fzf-native.nvim'
        use 'nvim-treesitter/nvim-treesitter'
        use 'nvim-tree/nvim-web-devicons'
        use 'nvim-telescope/telescope.nvim'
        use 'neovim/nvim-lspconfig'
        use 'williamboman/nvim-lsp-installer'
        use 'hrsh7th/nvim-cmp'
        use 'hrsh7th/cmp-nvim-lsp'
        use 'simrat39/rust-tools.nvim'
        use 'hrsh7th/vim-vsnip'
        use 'hrsh7th/cmp-vsnip'
        use 'hrsh7th/cmp-path'
        use 'hrsh7th/cmp-buffer'
        use 'tc50cal/vim-terminal'
        use 'Canop/nvim-bacon'

        use {
            "folke/trouble.nvim",
            requires = "nvim-tree/nvim-web-devicons",
            config = function()
                require("trouble").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end
        }

        --[[
        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                require("lspsaga").setup({
                    lightbuld = {
                        enable = false,
                    },
                })
            end,
            requires = {
                { "nvim-tree/nvim-web-devicons" },
                --Please make sure you install markdown and markdown_inline parser
                { "nvim-treesitter/nvim-treesitter" }
            }
        })
    --]]

        if packer_bootstrap then
            require('packer').sync()
        end
    end)
