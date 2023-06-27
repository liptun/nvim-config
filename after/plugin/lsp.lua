local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
  local opts = { buffer = bufnr, remap = false }
  vim.keymap.set("n", "gh", function() vim.lsp.buf.hover() end, opts)
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

require('lspconfig').jsonls.setup {
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
