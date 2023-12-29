local builtin = require('telescope.builtin')

-- File Related --
vim.keymap.set('n', '<leader><leader>', builtin.git_files, { desc = "Find files in current git project" })
vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = "Find File"})
vim.keymap.set('n', '<leader>sf', builtin.live_grep, { desc = "Grep Files"})


-- Search Related --
vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = "Search Commands" })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = "Search Keymaps" })
vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { desc = "Grep current buffer" })


vim.keymap.set('n', '<leader>x', builtin.diagnostics, { desc = "Telescope Diagnostics" })

