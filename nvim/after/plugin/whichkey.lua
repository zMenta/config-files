local wk = require("which-key")

wk.register({

	-- +File --
	["<leader>f"] = { name = "+File" },
	-- Telescope Binds
	["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find File" },
	["<leader><leader>"] = { "<cmd>Telescope git_files<cr>", "Find files in current git project" },
	["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Grep Files" },
	["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Find Buffer" },


	-- Telescope File Browser --
	["<leader>."] = { "<cmd>Telescope file_browser<cr>", "Telescope|Browse files" },

	-- Telescope Project --
	["<leader>p"] = { "<cmd>Telescope file_browser<cr>", "Telescope|Projects" },

	-- Quit Keybind --
	["<leader>Q"] = { "<cmd>quitall<cr>", "Quit Nvim" },


	-- Package Manager --
	["<leader>S"] = { "<cmd>PackerSync<cr>", "Sync Packages" },


	-- +Search --
	["<leader>s"] = { name = "+Search" },
	-- Telescope Binds
	["<leader>sc"] = { "<cmd>Telescope commands<cr>", "Commands" },
	["<leader>sk"] = { "<cmd>Telescope keymaps<cr>", "Keybinds" },
	["<leader>sb"] = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer" },


	-- +Toggle --
	["<leader>t"] = { name = "+Toggle" },
	-- Undotree
	["<leader>tu"] = { "<cmd>UndotreeToggle<cr>", "Undotree" },
	-- ToggleTerm
	["<leader>tt"] = { "<cmd>ToggleTerm<cr>", "Terminal" },


	-- +Open --
	["<leader>o"] = { name = "+Open" },
	-- (Ex)plorer
	["<leader>oe"] = { "<cmd>Ex<cr>", "Explorer" },
	["<leader>oc"] = { "<cmd>Ex ~/.config/nvim<cr>", "Config Files" },


	-- +Git --
	["<leader>g"] = { name = "+Git" },
	-- Neogit
	["<leader>gg"] = { "<cmd>Neogit<cr>", "Open Neogit" },


	-- +Window --
	["<leader>w"] = { name = "+Window" },
	-- Basic behaviour
	["<leader>wv"] = { "<cmd>wincmd v<cr>", "New Vertical Window" },
	["<leader>ws"] = { "<cmd>split<cr>", "Split Window" },
	["<leader>wc"] = { "<cmd>wincmd c<cr>", "Close Window" },
	["<leader>wq"] = { "<cmd>wincmd c<cr>", "Close Window" },
	["<leader>wh"] = { "<cmd>wincmd h<cr>", "Move to the left window" },
	["<leader>wl"] = { "<cmd>wincmd l<cr>", "Move to the right window" },
	["<leader>wj"] = { "<cmd>wincmd j<cr>", "Move to the bottom window" },
	["<leader>wk"] = { "<cmd>wincmd k<cr>", "Move to the upper window" },
	-- Resizing
	["<leader>wL"] = { "<cmd>wincmd 20><cr>", "Increase window width" },
	["<leader>wH"] = { "<cmd>wincmd 20<<cr>", "Decrease window width" },
	["<leader>wJ"] = { "<cmd>wincmd 5+<cr>", "Increase window height" },
	["<leader>wK"] = { "<cmd>wincmd 5-<cr>", "Decrease window height" },
	["<leader>w="] = { "<cmd>wincmd =<cr>", "Normalize windows size" },


	-- +Buffer --
	["<leader>b"] = { name = "+Buffer" },
	--Basic behaviour
	["<leader>bn"] = { "<cmd>bn<cr>", "Next buffer" },
	["<leader>bp"] = { "<cmd>bp<cr>", "Previous buffer" },
	["<leader>bk"] = { "<cmd>bp|bd #<cr>", "Kill current buffer" },


	-- +Code --
	["<leader>c"] = { name = "+Code" },
	-- LSP
	["<leader>ck"] = { "<cmd>vim.lsp.buf.hover<cr>", "LSP|Open documentation" },
	["<leader>cd"] = { "<cmd>vim.lsp.buf.definition<cr>", "LSP|Definition" },
	["<leader>cD"] = { "<cmd>vim.lsp.buf.declaration<cr>", "LSP|Declaration" },
	["<leader>ci"] = { "<cmd>vim.lsp.buf.implementation<cr>", "LSP|Implementation" },
	["<leader>cs"] = { "<cmd>vim.lsp.buf.signature_help<cr>", "LSP|Signature help" },
	["<leader>cr"] = { "<cmd>vim.lsp.buf.rename<cr>", "LSP|Rename" },
	["<leader>cR"] = { "<cmd>vim.lsp.buf.references<cr>", "LSP|References" },
	-- Telescope Diagnostics
	["<leader>cx"] = { "<cmd>Telescope diagnostics<cr>", "LSP|Diagnostics" },
	

})
