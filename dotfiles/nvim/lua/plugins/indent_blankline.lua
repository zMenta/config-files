return {
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = true, -- enables or disable this plugin
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {
			scope = {show_end = false},
			indent = {char = "┃"},
		},
	}
}
