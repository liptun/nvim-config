vim.g.mapleader = " "
vim.keymap.set("n", "<leader>px", vim.cmd.Ex)

vim.keymap.set("n", "<leader>r", function() vim.cmd("set relativenumber!") end)
vim.keymap.set("n", "<leader>h", function() vim.cmd("noh") end)

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>ss", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>ff", function() vim.lsp.buf.format() end)
vim.keymap.set("n", "<leader>K", function() vim.diagnostic.open_float() end)
