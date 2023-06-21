vim.g.mapleader = " "
vim.keymap.set("n", "<leader>px", vim.cmd.Ex)

vim.keymap.set("n", "<leader>pp", function() vim.cmd("set paste!") end)
vim.keymap.set("n", "<leader>r", function() vim.cmd("set relativenumber!") end)
vim.keymap.set("n", "<leader>h", function() vim.cmd("noh") end)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>t", function () vim.cmd("terminal") end)
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
