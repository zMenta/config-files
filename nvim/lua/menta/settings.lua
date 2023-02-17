----------------------
-- General Settings --
----------------------

vim.opt.nu = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers

-- Tab settings
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true

vim.opt.smartindent = true -- Smart Indent

-- Undos
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" --So UndoTree can look up older undos and keep track of it.

-- Search highlights
vim.opt.hlsearch = false -- After search, do not keep searched words highlighted.
vim.opt.incsearch = true -- Keep highlights being updated while the search in being made.

vim.opt.termguicolors = true

vim.opt.scrolloff = 8 -- Min vertical lines surrounding the cursor.
vim.opt.signcolumn = "yes" -- More space on the line number column.
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50


