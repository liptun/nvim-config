require("neotest").setup({
    adapters = {
        require("neotest-vitest")({})
    },
})

vim.keymap.set("n", "<leader>tr", ":Neotest run<CR>")

