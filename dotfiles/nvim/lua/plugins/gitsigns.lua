-- Code folding pluging
return {
	'lewis6991/gitsigns.nvim',
	enabled = true, -- enables or disables this plugin
	config = function() -- Specific plugin configuration
			local gitsigns = require('gitsigns')
			gitsigns.setup()
			-------------
			-- Keymaps --
			-------------
			vim.keymap.set('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = "Toggle line blame" })
			vim.keymap.set('n', '<leader>gb', gitsigns.blame, { desc = "View file blame" })
			vim.keymap.set('n', '<leader>ghh', gitsigns.preview_hunk_inline, { desc = "Preview Git Hunk Inline" })
			vim.keymap.set('n', '<leader>ghd', gitsigns.reset_hunk, { desc = "Discard Hunk" })
			vim.keymap.set('n', '<leader>gH', gitsigns.preview_hunk, { desc = "Preview Git Hunk" })
			vim.keymap.set('n', ']h', function() gitsigns.nav_hunk("next") end, { desc = "Next Hunk" })
			vim.keymap.set('n', '[h', function() gitsigns.nav_hunk("prev") end, { desc = "Previous Hunk" })
    end,
}
