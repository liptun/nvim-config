local fzf = require("fzf-lua")

fzf.setup({
    winopts = {
        height = 0.8,
        width = 0.94,
        row = 0.1,
        col = 0.5,
        border = "rounded",
        keymap = {
        },
    },
    preview = {
        horizontal = "right:55%",
    },
    keymap = {
        builtin = {
        },
    },
    files = {
        prompt = "> ",
        previewer = "bat",
        git_icons = true,
    },
})

local function openFileBrowser()
    local ok = pcall(function()
        fzf.git_files({ show_untracked = true })
    end)
    if not ok then
        fzf.files({ hidden = true })
    end
end

vim.keymap.set("n", "<C-p>", openFileBrowser, {})
vim.keymap.set("n", "<C-o>", function() fzf.files({ hidden = true }) end, {})
vim.keymap.set("n", "<C-f>", fzf.live_grep, {})

local opts = {
    lsp = {
        _get_picker_opts = function(title)
            return { prompt = title }
        end,
    }
}

vim.keymap.set("n", "gi", function() fzf.lsp_implementations({ prompt = "LSP Implementations" }) end)
vim.keymap.set("n", "gt", function() fzf.lsp_type_definitions({ prompt = "LSP Type Definitions" }) end)
