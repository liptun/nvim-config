local fzf = require("fzf-lua")

fzf.setup({
    winopts = {
        height = 0.8,
        width = 0.94,
        row = 0.1,
        col = 0.5,
        border = "rounded",
    },
    preview = {
        horizontal = "right:55%",
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
vim.keymap.set("n", "<C-l>", function() fzf.files({ hidden = true }) end, {})
vim.keymap.set("n", "<C-f>", fzf.live_grep, {})
