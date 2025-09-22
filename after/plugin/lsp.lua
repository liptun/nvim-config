local lsp_zero = require('lsp-zero')
local fzf = require("fzf-lua")

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

lsp_zero.set_sign_icons {
    error = '',
    warn = '',
    hint = '󰉀',
    info = '󰙎'
}

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set('n', 'gd', function() fzf.lsp_definitions({ prompt = "LSP Definitions" }) end, opts)
    vim.keymap.set('n', 'gr', function() fzf.lsp_references({ prompt = "LSP References" }) end, opts)
    vim.keymap.set('n', 'ga', function() vim.lsp.buf.code_action() end, opts)
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'ts_ls',
        'eslint@4.8.0',
        'jsonls',
        'html',
        'cssls',
        'lua_ls',
        'bashls',
    },
    handlers = {
        function(server_name)
            -- default servers
            vim.lsp.start(vim.lsp.config[server_name])
        end,
        lua_ls = function()
            vim.lsp.config.lua_ls = {
                settings = {
                    Lua = {
                        runtime = {
                            version = 'LuaJIT',
                        },
                        diagnostics = {
                            globals = { 'vim' },
                        },
                        telemetry = {
                            enable = false,
                        },
                    },
                },
            }
            vim.lsp.start(vim.lsp.config.lua_ls)
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

-- GDScript custom server
vim.lsp.config.gdscript = {
    cmd = { "nc", "localhost", "6005" },
    filetypes = { "gd", "gdscript" },
    root_dir = vim.fs.dirname(vim.fs.find("project.godot", { upward = true })[1]),
    on_attach = function(client, bufnr)
        -- Keymaps or other on_attach customizations
    end,
}
-- vim.lsp.start(vim.lsp.config.gdscript)
