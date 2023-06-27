local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require("telescope").setup({
  defaults = {
    path_display={"smart"},
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
})

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

