local builtin = require('telescope.builtin')

-- Find Related --
vim.keymap.set('n', '<leader><leader>', builtin.git_files, { desc = "Find files in current git project" })
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = "Find File"})


-- Search Related --
vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = "Commands" })
vim.keymap.set('n', '<leader>sh', builtin.command_history, { desc = "Command History" })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = "Keymaps" })
vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { desc = "Grep Current Buffer"})
vim.keymap.set('n', '<leader>sf', builtin.live_grep, { desc = "Grep Files"})
vim.keymap.set('n', '<leader>sm', builtin.man_pages, { desc = "Man Pages"})


vim.keymap.set('n', '<leader>x', builtin.diagnostics, { desc = "Telescope Diagnostics" })
vim.keymap.set('n', '<leader>t', builtin.treesitter, { desc = "Treesitter Symbols" })
