return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
			-------------
			-- Keymaps --
			-------------
			vim.keymap.set("n", "<leader>M", function() vim.cmd([[Mason]]) end, { desc = "Open Mason" })
		end

	},
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			{ "mason-org/mason.nvim", opts = {} }
		},
		config = function()
			require('mason-lspconfig').setup {
				ensure_installed = {
					'lua_ls', -- Lua
					'bashls', -- Bash
					'marksman', -- markdown lsp
				},
				automatic_enabled = true, -- Automatic run vim.lsp.enable() for the servers installed with Mason
			}
		end
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				'nvim-telescope/telescope.nvim',
			},
			{
				--------------------------------------------
				-- Improved lua_ls LSP support for neovim --
				--------------------------------------------
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		-----------------------------
		-- Language servers config --
		-----------------------------------------------------------------------------------
		-- This setup is here since the following servers are not available with Mason.  --
		-- Otherwise, please configure each server in mason-lspconfig.                   --
		-----------------------------------------------------------------------------------
		config = function()
			vim.lsp.enable('gdscript')
			vim.lsp.enable('gdshader_lsp')

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					if not client then return end -- Returns if no LSP is attached
					local builtin = require('telescope.builtin')

					-----------------------------------
					-- Keybinds when LSP is attached --
					-----------------------------------
					vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, { desc = "LSP | Format the current buffer" })
					vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = "LSP | Telescope document Symbols" })
					vim.keymap.set('n', 'gR', builtin.lsp_references, { desc = "LSP | Telescope go to References" })
					vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = "LSP | Telescope go to Implementations" })
					vim.keymap.set('n', 'gd', builtin.lsp_definitions, { desc = "LSP | Telescope go to Definition" })
					vim.keymap.set('n', 'gt', builtin.lsp_type_definitions , { desc = "LSP | Telescope go to Type Definition" })
				end,
			})
		end
	}
}
