local builtin = require('telescope.builtin')
local t = require("telescope")


-- Telescope additional extestions --
t.load_extension "file_browser"
t.load_extension('project')

-- Telescope keybind settings 
vim.keymap.set('n', '<leader>ff', builtin.find_files, {}) -- find files in your current working directory, respects .gitignore
vim.keymap.set('n', '<leader><leader>', builtin.git_files, {}) -- find files through the output of git ls-files command.
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})


