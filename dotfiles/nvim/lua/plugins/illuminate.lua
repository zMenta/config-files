return {
	'RRethy/vim-illuminate',
	enabled = true, -- enables or disables this plugin
	config = function() -- Specific plugin configuration
			local illuminate = require('illuminate')
			-------------
			-- Keymaps --
			-------------
			vim.keymap.set('n', '<leader>ti', illuminate.toggle, { desc = "Toggle illuminate" })
    end,
}
