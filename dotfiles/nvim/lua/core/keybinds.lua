-------------------------------------------------
--                  Keybinds                   --
-------------------------------------------------
-- Also refer to the after/plugin/whichkey.lua --
-------------------------------------------------
-- Some plugin specific keybinds are also      --
--   found on after/plugin/ path.              --
-------------------------------------------------

-- Note --
-- `desc` are descriptions of the keybind. Whichkey read this value.

-- Sets the leader key to space
vim.g.mapleader = " "

-- Removes these keybinds.
-- vim.keymap.set("n", "<leader>o", "<nop>")
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "q", "<nop>") -- Removes the default command history keybind -> 'q:' and 'q/'

-- Diagnostics
vim.keymap.set('n', '<space>x', vim.diagnostic.open_float, { desc = "Open diagnostics"})
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostics"})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostics"})

-- In terminal mode goes back to normal mode by pressing <ESC>
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- On normal mode "n", when pressing leader + o + e. It will execute Explore command (Explore -> file explorer)
vim.keymap.set("n", "<leader>e", vim.cmd.Oil, { desc = "Open Oil Explorer"})

-- Let you move the selected area up or down.
-- vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- While moving with C-d and C-u (down or up), keeps the cursor centered.
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- When moving the cursor with searcher, keep the cursor centered.
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")


-- Pastes the yank clipboard deleting the visual mode selection region without overwriting your clipboard.
vim.keymap.set("x", "<C-p>", [["_dP]])

-- Yank to your computer clipboard, not just inside neovim.
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard"})
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Substitute all words on selected by the cursor.
vim.keymap.set("n", "<C-s>", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Replace all words under cursor"})
vim.keymap.set("v", "<C-s>", [[y:%s/\V<C-R>"/<C-R>"/gI<Left><Left><Left>]], { desc = "Replace selected region"})

-- folds
vim.keymap.set("n", "zm", "zM", {desc = "Close all folds"}) -- Fold all
vim.keymap.set("n", "zr", "zR", {desc = "Open all folds"}) -- Unfold all

-- crude autopairs
-- vim.keymap.set("i", '"', [[""<left>]], {desc = 'Autopairs " character'})
-- vim.keymap.set("i", "'", [[''<left>]], {desc = "Autopairs ' character"})
-- vim.keymap.set("i", "(", "()<left>", {desc = "Autopairs ( character"})
-- vim.keymap.set("i", "[", "[]<left>", {desc = "Autopairs [ character"})
-- vim.keymap.set("i", "{", "{}<left>", {desc = "Autopairs { character"})
