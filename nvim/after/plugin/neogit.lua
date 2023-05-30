local neogit = require('neogit')
neogit.setup {}

vim.keymap.set("n", "<leader>gg", vim.cmd.Neogit)
