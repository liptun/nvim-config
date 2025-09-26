local custom_gruvbox = require("lualine.themes.gruvbox")

-- normal grey
-- insert blue
-- visual orange
-- replace red
-- command green

custom_gruvbox.normal.a.bg = "#fabd2f"
custom_gruvbox.insert.a.bg = "#458588"
custom_gruvbox.command.a.bg = "#b8bb26"

custom_gruvbox.normal.c.bg = nil
custom_gruvbox.insert.c.bg = nil
custom_gruvbox.visual.c.bg = nil
custom_gruvbox.command.c.bg = nil

local function mode()
	local vimMode = require("lualine.utils.mode").get_mode()
	return " "..vimMode
end

require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = custom_gruvbox,
		component_separators = { left = '|', right = '|' },
		section_separators = { left = '', right = '' },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		}
	},
	sections = {
		lualine_a = { mode },
		lualine_b = { 'branch', 'diff', 'diagnostics' },
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
