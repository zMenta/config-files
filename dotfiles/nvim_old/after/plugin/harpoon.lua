local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file to Harpoon"} )
vim.keymap.set("n", "<leader>hh", ui.toggle_quick_menu, {desc = "Open Harpoon menu"} )

gasdgsda
gasgsa

vim.keymap.set("n", "<M-1>", function() ui.nav_file(1) end, {desc = "Harpoon open file 1"} )
vim.keymap.set("n", "<M-2>", function() ui.nav_file(2) end, {desc = "Harpoon open file 2"} )
vim.keymap.set("n", "<M-3>", function() ui.nav_file(3) end, {desc = "Harpoon open file 3"} )
vim.keymap.set("n", "<M-4>", function() ui.nav_file(4) end, {desc = "Harpoon open file 4"} )
vim.keymap.set("n", "<M-5>", function() ui.nav_file(5) end, {desc = "Harpoon open file 5"} )
vim.keymap.set("n", "<M-6>", function() ui.nav_file(6) end, {desc = "Harpoon open file 6"} )
vim.keymap.set("n", "<M-7>", function() ui.nav_file(7) end, {desc = "Harpoon open file 7"} )
vim.keymap.set("n", "<M-8>", function() ui.nav_file(8) end, {desc = "Harpoon open file 8"} )
vim.keymap.set("n", "<M-9>", function() ui.nav_file(9) end, {desc = "Harpoon open file 9"} )
vim.keymap.set("n", "<M-10>", function() ui.nav_file(10) end, {desc = "Harpoon open file 10"} )
