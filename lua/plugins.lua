local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { 'christoomey/vim-tmux-navigator' },
    { 'tpope/vim-fugitive' },
    { 'lewis6991/gitsigns.nvim' },
    { 'ellisonleao/gruvbox.nvim' },
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },
    { 'nvim-treesitter/nvim-treesitter-context' },
    {
        'ThePrimeagen/harpoon',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'prettier/vim-prettier' },
    {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-nvim-lsp',
            'L3MON4D3/LuaSnip',
        }
    },
    { 'b0o/schemastore.nvim' },
    { 'nvim-lualine/lualine.nvim' },
    { 'kyazdani42/nvim-web-devicons' },
    { 'luckasRanarison/tailwind-tools.nvim' }
})
