local hex = require 'hex'
hex.setup()

vim.keymap.set("n", "<leader>hh", function() hex.toggle() end)

vim.keymap.set("n", "<leader>hd", function() hex.dump() end)
vim.keymap.set("n", "<leader>ha", function() hex.assemble() end)
vim.keymap.set("n", "<leader>ht", function() hex.toggle() end)
