vim.g.mapleader = " "
vim.keymap.set("n", "<leader>px", vim.cmd.Ex)

vim.keymap.set("n", "<leader>pp", function() vim.cmd("set paste!") end)
vim.keymap.set("n", "<leader>r", function() vim.cmd("set relativenumber!") end)
vim.keymap.set("n", "<leader>h", function() vim.cmd("noh") end)

