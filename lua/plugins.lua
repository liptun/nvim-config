return require('packer').startup(function(use)
    use('wbthomason/packer.nvim')
    use('christoomey/vim-tmux-navigator')
    use('tpope/vim-fugitive')
    use('lewis6991/gitsigns.nvim')
    use({
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6',
        requires = { { 'nvim-lua/plenary.nvim' } }
    })
    use('ellisonleao/gruvbox.nvim')
    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/nvim-treesitter-context')
    use('ThePrimeagen/harpoon')
    use('mbbill/undotree')
    use('prettier/vim-prettier')
    use('Slotos/telescope-lsp-handlers.nvim')


    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
            {'williamboman/mason.nvim'},
            {'williamboman/mason-lspconfig.nvim'},
            { 'neovim/nvim-lspconfig' },
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'L3MON4D3/LuaSnip' },
        }
    }

    use { 'b0o/schemastore.nvim' }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'norcalli/nvim-colorizer.lua' }

    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })
end)
