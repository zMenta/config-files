------------------------------------
--           Keybinds             --
------------------------------------
-- Also refer to the whichkey.lua --
------------------------------------


-- Sets the leader key to space
vim.g.mapleader = " "

-- Removes these keybinds.
vim.keymap.set("n", "<leader>o", "<nop>")
vim.keymap.set("n", "Q", "<nop>")


-- On normal mode "n", when pressing leader + o + e. It will execute Explore command (Explore -> file explorer)
vim.keymap.set("n", "<leader>oe", vim.cmd.Explore)

-- Let you move the selected area up or down.
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- While moving with C-d and C-u (down or up), keeps the cursor centered.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When moving the cursor with searcher, keep the cursor centered.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Pastes the yank clipboard deleting the visual mode selection region without overwriting your clipboard.
vim.keymap.set("x", "<C-p>", [["_dP]])

-- FIX
-- Yank to your computer clipboard, not just inside neovim.
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Substitute all words on selected by the cursor.
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
