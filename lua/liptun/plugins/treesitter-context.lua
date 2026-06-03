-- Highlights
vim.api.nvim_set_hl(0, 'TreesitterContext', { bg = '#3c3836', fg = '#fbf1c7' })
vim.api.nvim_set_hl(0, 'TreesitterContextLineNumber', { bg = '#3c3836', fg = '#928374' })

-- Keybind
vim.keymap.set("n", "gc", function()
    require("treesitter-context").go_to_context()
end, { silent = true })

-- Debug commands
vim.api.nvim_create_user_command('ContextDebug', function()
    local ctx = require('treesitter-context')
    print("=== Treesitter-Context Debug ===")
    print("Enabled:", ctx.enabled())
    print("Config:", vim.inspect(ctx.config))
    
    local buf = vim.api.nvim_get_current_buf()
    local ft = vim.api.nvim_buf_get_option(buf, "filetype")
    print("Current filetype:", ft)
    
    local has_parser = pcall(vim.treesitter.get_parser, buf)
    print("Parser available:", has_parser)
    
    local win_height = vim.api.nvim_win_get_height(0)
    print("Window height:", win_height)
end, {})

vim.api.nvim_create_user_command('ContextToggle', function()
    require('treesitter-context').toggle()
    print("Context toggled")
end, {})
