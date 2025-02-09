----------------------
-- General Settings --
----------------------

vim.opt.colorcolumn = "100" -- Virtual column displayed on the screen 
vim.opt.nu = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.wrap = false -- Line Wrap

-- Tab settings
vim.opt.tabstop = 4 -- Size of tab character
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- vim.opt.expandtab = true -- Changes the tab character to spaces

vim.opt.smartindent = true -- Smart Indent

-- Splits
vim.opt.splitbelow = true -- On horizontal split, new window is on the bottom
vim.opt.splitright = true -- On vertical split, new window is on the right

-- Undos
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" --So UndoTree can look up older undos and keep track of it.
vim.opt.undofile = true

-- Misc
vim.opt.virtualedit = "block" -- In visual block, creates virtual spaces on the screen
vim.opt.inccommand = "split" -- With substitutions, split the window and show affected lines
vim.opt.ignorecase = true -- Make autocompletion on commands case insensitive

-- Search highlights
vim.opt.hlsearch = false -- After search, do not keep searched words highlighted.
vim.opt.incsearch = true -- Keep highlights being updated while the search in being made.

vim.opt.termguicolors = true

vim.opt.scrolloff = 14 -- Min vertical lines surrounding the cursor.
vim.opt.signcolumn = "yes" -- More space on the line number column.
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
