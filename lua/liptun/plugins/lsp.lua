require("mason").setup({})

require("mason-lspconfig").setup({
    ensure_installed = {
        "clangd",
        "cssls",
        "eslint",
        "html",
        "jsonls",
        "lua_ls",
        "rust_analyzer",
        "tailwindcss",
        "ts_ls",
    },
    automatic_installation = true,
    handlers = {
        function(server_name)
            vim.lsp.start(vim.lsp.config[server_name])
        end,
        jsonls = function()
            vim.lsp.config.jsonls = {
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = { enable = true },
                    },
                },
            }
            vim.lsp.start(vim.lsp.config.jsonls)
        end,
        lua_ls = function()
            vim.lsp.config.lua_ls = {
                settings = {
                    Lua = {
                        runtime = { version = "LuaJIT" },
                        diagnostics = { globals = { "vim" } },
                        telemetry = { enable = false },
                    },
                },
            }
            vim.lsp.start(vim.lsp.config.lua_ls)
        end,
    },
})

vim.keymap.set("n", "<leader>fp", function() vim.cmd("PrettierAsync") end)
