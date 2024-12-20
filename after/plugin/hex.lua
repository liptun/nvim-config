local hex = require 'hex'
hex.setup()

vim.keymap.set("n", "<leader>xx", function() hex.toggle() end)

vim.keymap.set("n", "<leader>xd", function() hex.dump() end)
vim.keymap.set("n", "<leader>xa", function() hex.assemble() end)
vim.keymap.set("n", "<leader>xt", function() hex.toggle() end)
