-- FIX: Changed 'nvim-treesitter.configs' to 'nvim-treesitter'
require('nvim-treesitter').setup {
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
        "markdown", -- Added this since you're using mdx below
        "markdown_inline",
    },
    sync_install = false,
    auto_install = true,

    highlight = {
        enable = true,
        disable = function(lang, buf)
            local ft = vim.api.nvim_buf_get_option(buf, "filetype")
            local bt = vim.api.nvim_buf_get_option(buf, "buftype")
            -- disable for Telescope prompt/results and other prompt-like buffers
            if ft == "TelescopePrompt" or ft == "TelescopeResults" or bt == "prompt" then
                return true
            end
            return false
        end,
        additional_vim_regex_highlighting = false,
    },
}

-- The rest of your config for context remains perfectly fine!
require('treesitter-context').setup {
    enable = true,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
    on_attach = nil,
}

-- Map mdx to markdown treesitter parser
vim.treesitter.language.register('markdown', 'mdx')

-- Jump to context keybind
vim.keymap.set("n", "gc", function()
    require("treesitter-context").go_to_context()
end, { silent = true })

