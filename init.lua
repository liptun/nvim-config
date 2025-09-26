require("liptun.core.options")
require("liptun.core.keymaps")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {
            "git",
            "clone",
            "--filter=blob:none",
            "https://github.com/folke/lazy.nvim.git",
            "--branch=stable",
            lazypath
        }
    )
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        { "folke/lazy.nvim" },
        { 'christoomey/vim-tmux-navigator' },
        { 'tpope/vim-fugitive' },
        {
            'lewis6991/gitsigns.nvim',
            config = function()
                require("liptun.plugins.gitsigns")
            end
        },
        {
            "ellisonleao/gruvbox.nvim",
            config = function()
                require("liptun.plugins.gruvbox")
            end
        },
        {
            "ThePrimeagen/harpoon",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("liptun.plugins.harpoon")
            end
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("liptun.plugins.telescope")
            end
        },

        {
            "neovim/nvim-lspconfig",
            dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "b0o/schemastore.nvim",
                "prettier/vim-prettier",
            },
            config = function()
                require("liptun.plugins.lsp")
            end,
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "L3MON4D3/LuaSnip",
                "saadparwaiz1/cmp_luasnip",
            },
            config = function()
                require("liptun.plugins.cmp")
            end
        },
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            dependencies = {
                'nvim-treesitter/nvim-treesitter-context'
            },
            config = function()
                require("liptun.plugins.treesitter")
            end
        },
        {
            'nvim-lualine/lualine.nvim',
            config = function()
                require("liptun.plugins.lualine")
            end
        },
        { 'kyazdani42/nvim-web-devicons' },
    }
)
