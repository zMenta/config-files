-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope --
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}


	-- Telescope File Browser --
	use {
		"nvim-telescope/telescope-file-browser.nvim",
		requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	}


	-- Telescope Project -- 
	use "nvim-telescope/telescope-project.nvim"


	-- Color Themes -- 
	use 'navarasu/onedark.nvim' --Onedark
	use 'folke/tokyonight.nvim' -- Tokyo Night


	-- Treesitter -- 
	use (
	'nvim-treesitter/nvim-treesitter',
	{run = ':TSUpdate'}
	)

	-- UndoTree --
	use 'mbbill/undotree'

	-- NeoGit --
	use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

	-- LSP --
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v1.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},             -- Required
			{'williamboman/mason.nvim'},           -- Optional
			{'williamboman/mason-lspconfig.nvim'}, -- Optional

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},         -- Required
			{'hrsh7th/cmp-nvim-lsp'},     -- Required
			{'hrsh7th/cmp-buffer'},       -- Optional
			{'hrsh7th/cmp-path'},         -- Optional
			{'saadparwaiz1/cmp_luasnip'}, -- Optional
			{'hrsh7th/cmp-nvim-lua'},     -- Optional

			-- Snippets
			{'L3MON4D3/LuaSnip'},             -- Required
			{'rafamadriz/friendly-snippets'}, -- Optional
		}
	}


	-- Which Key --
	use {
		"folke/which-key.nvim",
		config = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
			require("which-key").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
			}
		end
	}

	-- DAP -- 		
	use 'mfussenegger/nvim-dap'


	-- Comment --
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}


	-- LuaLine Statusline --
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- Indent Blankline --
	use "lukas-reineke/indent-blankline.nvim"

	-- Git signs --
	use 'lewis6991/gitsigns.nvim' 

	-- Toggle Term --
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}


	-- Trouble --
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}


	-- Lsp lines --
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})


	-- Todo Comments --
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}

end)
