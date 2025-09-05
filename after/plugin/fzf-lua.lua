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
    if vim.fn.isdirectory(".git") == 1 then
        fzf.git_files({ show_untracked = true })
    else
        fzf.files({ hidden = true })
    end
end

local function live_grep_git_files()
    fzf.live_grep({
        cmd = "rg --files | xargs rg --color=always --line-number --no-heading --smart-case -F",
        silent = true,
    })
end

vim.keymap.set("n", "<C-p>", openFileBrowser, {})
vim.keymap.set("n", "<C-f>", live_grep_git_files, {})
