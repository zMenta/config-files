local lspname = function ()
	local icon = ' LSP:'
	local msg = ''
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return icon .. client.name
      end
    end
    return msg
end

return {
	{
		'nvim-lualine/lualine.nvim',
		enabled = true, -- enables or disable this plugin
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
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
				lualine_a = {},
				lualine_b = {'branch', 'diff', 'diagnostics'},
				lualine_c = {'filesize', 'filename'},
				lualine_x = { lspname, 'encoding', 'fileformat', 'filetype'},
				lualine_y = {'progress', 'location'},
				lualine_z = {}
			},

			-- Statusline sections when not on focus
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {'filesize', 'filename'},
				lualine_x = {'location'},
				lualine_y = {},
				lualine_z = {}
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {}
		}
	}
}
