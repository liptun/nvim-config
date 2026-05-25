local conform = require("conform")

conform.setup({
    formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        svelte = { "prettier" },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        graphql = { "prettier" },
        lua = { "stylua" }, -- Optional: since you use Mason, install stylua too!
    },
    formatters = {
        prettier = {
            -- This ensures single quotes are used UNLESS a .prettierrc exists
            prepend_args = { "--single-quote" },
        },
    },
})
