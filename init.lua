require("core.options")
require("core.keymaps")

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
        {
            "ellisonleao/gruvbox.nvim",
            config = function()
                require("plugins.gruvbox")
            end
        },
        {
            "ThePrimeagen/harpoon",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("plugins.harpoon")
            end
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = { "nvim-lua/plenary.nvim" },
            config = function()
                require("plugins.telescope")
            end
        },

        {
            "neovim/nvim-lspconfig",
            dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "b0o/schemastore.nvim",
                "prettier/vim-prettier",
                'luckasRanarison/tailwind-tools.nvim'
            },
            config = function()
                require("plugins.lsp")
            end,
        },
        {
            'nvim-treesitter/nvim-treesitter',
            build = ':TSUpdate',
            dependencies = {
                'nvim-treesitter/nvim-treesitter-context'
            },
            config = function()
                require("plugins/treesitter")
            end
        },
        {
            'nvim-lualine/lualine.nvim',
            config = function()
                require("plugins/lualine")
            end
        },
        { 'kyazdani42/nvim-web-devicons' },
    }
)
