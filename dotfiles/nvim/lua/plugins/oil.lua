return {
	{
		'stevearc/oil.nvim',
		enabled = true, -- enables or disables this plugin
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		config = function()
			require("oil").setup()
			-------------
			-- Keymaps --
			-------------
			-- On normal mode "n", when pressing leader + o + e. It will execute Explore command (Explore -> file explorer)
			vim.keymap.set("n", "<leader>e", vim.cmd.Oil, { desc = "Open Oil Explorer"})
		end
	}
}
