vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoread = true
vim.opt.showcmd = true
vim.opt.timeoutlen = 800

vim.opt.termguicolors = true
vim.opt.showmode = false

vim.opt.mouse = ""

-- Set tab settings for GDScript files
vim.api.nvim_create_autocmd("FileType", {
    pattern = "gdscript",
    callback = function()
        vim.opt_local.expandtab = false  -- Use tabs instead of spaces
        vim.opt_local.tabstop = 4         -- Number of spaces a tab counts for
        vim.opt_local.shiftwidth = 4      -- Number of spaces for each step of (auto)indent
    end,
})
