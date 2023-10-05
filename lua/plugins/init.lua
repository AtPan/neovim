local ensure_packer = function()
    local vfn = vim.fn
    local install_path = vfn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if vfn.empty(vfn.glob(install_path)) > 0 then
        vfn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local bootstrap_packer = ensure_packer()
local packer = require('packer')
return packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'nvim-telescope/telescope-fzf-native.nvim'
    use 'simrat39/rust-tools.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

    use 'ziglang/zig.vim'

    end)
