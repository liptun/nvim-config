require("liptun.core.options")
require("liptun.core.keymaps")
require("liptun.core.custom")

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
            "nvim-tree/nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup { default = true }
            end
        },
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "b0o/schemastore.nvim",
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
            opts = {
                ensure_installed = {
                    "vimdoc",
                    "lua",
                    "javascript",
                    "typescript",
                    "yaml",
                    "json",
                    "html",
                    "css",
                    "rust",
                    "markdown",
                    "markdown_inline",
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local ft = vim.api.nvim_buf_get_option(buf, "filetype")
                        local bt = vim.api.nvim_buf_get_option(buf, "buftype")
                        if ft == "TelescopePrompt" or ft == "TelescopeResults" or bt == "prompt" then
                            return true
                        end
                        return false
                    end,
                    additional_vim_regex_highlighting = false,
                },
            },
            config = function()
                vim.treesitter.language.register('markdown', 'mdx')
            end,
        },
        {
            'nvim-treesitter/nvim-treesitter-context',
            dependencies = { 'nvim-treesitter/nvim-treesitter' },
            opts = {
                enable = true,
                max_lines = 3,
                min_window_height = 5,
                line_numbers = true,
                multiline_threshold = 20,
                trim_scope = 'outer',
                mode = 'cursor',
                separator = '─',
                zindex = 20,
            },
            config = function()
                require("liptun.plugins.treesitter-context")
            end
        },
        {
            'nvim-lualine/lualine.nvim',
            config = function()
                require("liptun.plugins.lualine")
            end
        },
        {
            "github/copilot.vim",
            event = "InsertEnter",
            config = function()
                require("liptun.plugins.copilot");
            end
        },
        {
            "stevearc/conform.nvim",
            event = { "BufWritePre" },
            cmd = { "ConformInfo" },
            config = function()
                require("liptun.plugins.conform")
            end,
        },
    }
)
