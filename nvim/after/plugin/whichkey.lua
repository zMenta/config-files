local wk = require("which-key")

wk.register({
	--------------
	-- Prefixes --
	--------------
	-- +File --
	["<leader>f"] = { name = "+File" },

	-- +Harpoon --
	["<leader>h"] = { name = "+Harpoon" },

	-- +Search --
	["<leader>s"] = { name = "+Search" },

	-- +Git --
	["<leader>g"] = { name = "+Git" },

	-- +Code --
	-- ["<leader>c"] = { name = "+Code" },
	-- Nothing here.
	

	-------------------------
	-- Additional Keybinds --
	-------------------------
	-- Package Manager --
	["<leader>L"] = { "<cmd>Lazy<cr>", "Lazy" },

	-- Quit Nvim --
	["<leader>Q"] = { "<cmd>quitall<cr>", "Quit Nvim" },


	-- +Open --
	["<leader>o"] = { name = "+Open" },
	-- Explore Config Files --
	["<leader>oc"] = { "<cmd>Ex ~/.config/nvim<cr>", "Open config files" },


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

})
