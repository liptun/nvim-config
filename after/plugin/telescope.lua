local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

require("telescope").setup({
    defaults = {
        -- path_display = { "smart" },
        -- prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        -- selection_strategy = "reset",
        -- sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "bottom",
                preview_width = 0.55,
                results_width = 0.8,
            },
            width = 0.94,
            height = 0.80,
            preview_cutoff = 120,
        },
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})

local function openFileBrowser()
    local isGitRepo = pcall(function()
        builtin.git_files({ show_untracked = true })
    end)
    if not isGitRepo then
        builtin.find_files({ hidden = true })
    end
end

vim.keymap.set('n', '<C-p>', openFileBrowser, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})
vim.keymap.set('n', '<C-f>', builtin.live_grep, {})

require('telescope-lsp-handlers').setup({
    declaration = {
        disabled = false,
        picker = { prompt_title = 'LSP Declarations' },
        no_results_message = 'Declaration not found',
    },
    definition = {
        disabled = false,
        picker = { prompt_title = 'LSP Definitions' },
        no_results_message = 'Definition not found',
    },
    implementation = {
        disabled = false,
        picker = { prompt_title = 'LSP Implementations' },
        no_results_message = 'Implementation not found',
    },
    type_definition = {
        disabled = false,
        picker = { prompt_title = 'LSP Type Definitions' },
        no_results_message = 'Type definition not found',
    },
    reference = {
        disabled = false,
        picker = { prompt_title = 'LSP References' },
        no_results_message = 'No references found'
    },
    document_symbol = {
        disabled = false,
        picker = { prompt_title = 'LSP Document Symbols' },
        no_results_message = 'No symbols found',
    },
    workspace_symbol = {
        disabled = false,
        picker = { prompt_title = 'LSP Workspace Symbols' },
        no_results_message = 'No symbols found',
    },
    incoming_calls = {
        disabled = false,
        picker = { prompt_title = 'LSP Incoming Calls' },
        no_results_message = 'No calls found',
    },
    outgoing_calls = {
        disabled = false,
        picker = { prompt_title = 'LSP Outgoing Calls' },
        no_results_message = 'No calls found',
    },
})
