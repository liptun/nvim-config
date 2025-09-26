require('mason').setup({})
require('mason-lspconfig').setup({
    handlers = {
        function(server_name)
            -- default servers
            vim.lsp.start(vim.lsp.config[server_name])
        end,
        jsonls = function()
            vim.lsp.config.jsonls = {
                settings = {
                    json = {
                        schemas = require('schemastore').json.schemas(),
                        validate = { enable = true },
                    },
                }
            }
            vim.lsp.start(vim.lsp.config.jsonls)
        end,
    },
})
