local telescope = require("telescope")
local builtin = require("telescope.builtin")

telescope.setup {}

vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<C-f>", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Git files" })
vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "Search in files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

vim.keymap.set("n", "gr", function()
    require("telescope.builtin").lsp_references({ prompt_title = "LSP References" })
end, opts)

vim.keymap.set("n", "gd", function()
    require("telescope.builtin").lsp_definitions({ prompt_title = "LSP Definitions" })
end, opts)

vim.keymap.set("n", "gt", function()
    builtin.lsp_type_definitions({ prompt_title = "LSP Type Definitions" })
end, opts)

vim.keymap.set("n", "<leader>ws", function()
    builtin.lsp_workspace_symbols({ prompt_title = "Workspace Symbols" })
end, opts)

vim.keymap.set("n", "<leader>ds", function()
    builtin.lsp_document_symbols({ prompt_title = "Document Symbols" })
end, opts)

vim.keymap.set("n", "gi", function()
    builtin.lsp_implementations({ prompt_title = "LSP Implementations" })
end, opts)

