------------------------------------------------------
--      Lazy configuration and plugin list          --
------------------------------------------------------
-- Plugin specific config is found in after/plugin ---
------------------------------------------------------


----------------------------------------
-- Installs Lazy if not installed     --
----------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)



-------------------
--  Plugin list  --
-------------------
local plugins = {
	-- Color Theme --
	{"navarasu/onedark.nvim", lazy = false, priority = 1000},

	-- Look and Feel --
	"lukas-reineke/indent-blankline.nvim",
	"lewis6991/gitsigns.nvim",

	-- Dependencies --
	'nvim-lua/plenary.nvim', -- harpoon, telescope

	-- Utility & Tools --
	{'nvim-telescope/telescope.nvim', tag = '0.1.1'},
	'ThePrimeagen/harpoon',
	'mbbill/undotree',
	'TimUntersberger/neogit',
	'numToStr/Comment.nvim',
	{
	  "folke/which-key.nvim",
	  event = "VeryLazy",
	  init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	  end,
	},

	-- Treesitter -- 
	{'nvim-treesitter/nvim-treesitter', build = function() pcall(vim.cmd, 'TSUpdate') end,},

	-- Completion and LSP --
	{
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  dependencies = {
	    -- LSP Support
	    {'neovim/nvim-lspconfig'},             -- Required
	    {'williamboman/mason.nvim', build = function() pcall(vim.cmd, 'MasonUpdate') end,},  -- Optional
	    {'williamboman/mason-lspconfig.nvim'}, -- Optional

	    -- Autocompletion
	    {'hrsh7th/nvim-cmp'},     -- Required
	    {'hrsh7th/cmp-nvim-lsp'}, -- Required
	    {'L3MON4D3/LuaSnip'},     -- Required
	  }
	}

}


local opts = {}

require("lazy").setup(plugins, opts)
