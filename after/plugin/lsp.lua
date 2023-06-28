local lsp = require('lsp-zero').preset({})

local lspconfig = require("lspconfig")

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set('n', 'gr', function() vim.lsp.buf.references() end, opts)

  -- vim.keymap.set('n', 'gD', function() vim.lsp.buf.declaration() end, opts)
  -- vim.keymap.set('n', 'gi', function() vim.lsp.buf.implementation() end, opts)
  -- vim.keymap.set('n', 'go', function() vim.lsp.buf.type_definition() end, opts)
  -- vim.keymap.set('n', 'gs', function() vim.lsp.buf.signature_help() end, opts)
  -- vim.keymap.set('n', '<F2>', function() vim.lsp.buf.rename() end, opts)
  -- vim.keymap.set({ 'n', 'x' }, function() vim.lsp.buf.format({ async = true }) end, opts)
  -- vim.keymap.set('n', '<F4>', function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set('n', 'gl', function() vim.diagnostic.open_float() end, opts)
  -- vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
  -- vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
end)

lspconfig.tsserver.setup({})
lspconfig.eslint.setup({})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lspconfig.jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'jsonls',
  'html',
  'cssls',
  'lua_ls',
  'bashls',
  'pyright',
  'pylsp'
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ["<C-Space>"] = cmp.mapping.complete()
})


lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.setup()
