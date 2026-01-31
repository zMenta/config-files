return {
	{
		'nvim-telescope/telescope.nvim',
		version = '*',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			require('telescope').setup {
				defaults = {
					layout_strategy = 'vertical',
					layout_config = { height = 0.98, width = 0.98 },
				},
				extensions = {
					fzf = {}
				}
			}
			require('telescope').load_extension('fzf')
			-- require('telescope.themes').get_ivy()
			require('telescope.themes').get_cursor()
			local builtin = require('telescope.builtin')

			-- File Pickers --
			vim.keymap.set('n', '<leader><leader>', builtin.git_files, { desc = "Search files in current git project" })
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = "Files" })
			vim.keymap.set('n', '<leader>s.', function () vim.cmd([[Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍]]) end, { desc = "Files +Hidden" })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = "Files with Grep" })

			-- Vim pickers --
			vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = "Buffers" })
			vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = "Oldfiles" })
			vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = "Commands" })
			vim.keymap.set('n', '<leader>sh', builtin.command_history, { desc = "Command History" })
			vim.keymap.set('n', '<leader>sH', builtin.help_tags, { desc = "Help Tags" })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = "Keymaps" })
			vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { desc = "Grep Current Buffer" })
			vim.keymap.set('n', '<leader>sm', builtin.man_pages, { desc = "Man Pages" })

			-- Treesitter Picker --
			vim.keymap.set('n', '<leader>st', builtin.treesitter, { desc = "Treesitter Symbols" })

			-- LSP Pickers --
			vim.keymap.set('n', '<leader>X', builtin.diagnostics, { desc = "Telescope Diagnostics" })
		end
	}
}
