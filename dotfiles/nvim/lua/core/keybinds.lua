-------------------------------------------------
--                  Keybinds                   --
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

-- Windows --
vim.keymap.set("n", "<leader>ws", "<c-w>s", { desc = "Split Window" })
vim.keymap.set("n", "<leader>wv", "<c-w>v", { desc = "Split Window Vertically" })
vim.keymap.set("n", "<leader>wc", "<c-w>c", { desc = "Close Window" })
--- Resizing
vim.keymap.set("n", "<leader>wI", "<c-w>15>", { desc = "Increase Window Width Size" })
vim.keymap.set("n", "<leader>wD", "<c-w>15<", { desc = "Increase Window Width Size" })
vim.keymap.set("n", "<leader>wi", "<c-w>10+", { desc = "Increase Window Height Size" } )
vim.keymap.set("n", "<leader>wd", "<c-w>10-", { desc = "Decrease Window Height Size" })
vim.keymap.set("n", "<leader>w=", "<c-w>=", { desc = "Normalize Windows Sizes" })
--- Cursor movement
vim.keymap.set("n", "<leader>wl", "<c-w>l", { desc = "Move to the right window" })
vim.keymap.set("n", "<leader>wh", "<c-w>h", { desc = "Move to the left window" })
vim.keymap.set("n", "<leader>wj", "<c-w>j", { desc = "Move to the bottom window" })
vim.keymap.set("n", "<leader>wk", "<c-w>k", { desc = "Move to the upper window" })
-- Window movement
vim.keymap.set("n", "<leader>wL", "<c-w>L", { desc = "Move window to the right window" })
vim.keymap.set("n", "<leader>wH", "<c-w>H", { desc = "Move window to the left window" })
vim.keymap.set("n", "<leader>wJ", "<c-w>J", { desc = "Move window to the bottom window" })
vim.keymap.set("n", "<leader>wK", "<c-w>K", { desc = "Move window to the upper window" })

-- folds
-- vim.keymap.set("n", "zm", "zM", {desc = "Close all folds"}) -- Fold all
-- vim.keymap.set("n", "zr", "zR", {desc = "Open all folds"}) -- Unfold all

-- crude autopairs
-- vim.keymap.set("i", '"', [[""<left>]], {desc = 'Autopairs " character'})
-- vim.keymap.set("i", "'", [[''<left>]], {desc = "Autopairs ' character"})
-- vim.keymap.set("i", "(", "()<left>", {desc = "Autopairs ( character"})
-- vim.keymap.set("i", "[", "[]<left>", {desc = "Autopairs [ character"})
-- vim.keymap.set("i", "{", "{}<left>", {desc = "Autopairs { character"})
