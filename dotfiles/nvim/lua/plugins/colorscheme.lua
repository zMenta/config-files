return {
	{
		-- "navarasu/onedark.nvim",
		"sainnhe/gruvbox-material",
		-- "rebelot/kanagawa.nvim",
		enabled = true, -- enables or disable this plugin
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			-- vim.cmd([[colorscheme onedark]])
			vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_background = "hard"
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
}
