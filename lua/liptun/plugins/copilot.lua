vim.g.copilot_no_tab_map = true

vim.cmd("Copilot disable")

vim.g.copilot_filetypes = {
    lua = true,
    c = true,
    cpp = true,
    rust = true,
    javascript = true,
    javascriptreact = true,
    typescript = true,
    typescriptreact = true,
    ["*"] = false,
}

vim.api.nvim_set_keymap("i", "<C-K>", 'copilot#Next()', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Previous()', { silent = true, expr = true })
vim.api.nvim_set_keymap("i", "<C-L>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

vim.keymap.set("n", "<leader>c", function()
  local ft = vim.bo.filetype
  if vim.fn["copilot#Enabled"]() == 1 then
    vim.cmd("Copilot disable")
    print("Copilot disabled")
  else
    vim.cmd("Copilot enable")
    print("Copilot enabled")
  end
end, { noremap = true, silent = true })
