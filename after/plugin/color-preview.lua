local colorizer = require("colorizer")
colorizer.setup()

vim.keymap.set("n", "<leader>c", ":ColorizerToggle<CR>")
