return {
	{
		"williamboman/mason.nvim",
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
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			'saghen/blink.cmp',
			"neovim/nvim-lspconfig",
		},
		config = function()
			local capabilities = require('blink.cmp').get_lsp_capabilities() -- Code autocompletion capabilities
			require('mason-lspconfig').setup {
				-- Ensure server installations
				ensure_installed = {
					'lua_ls',
					'bashls',
				},
				automatic_installation = true, -- Automatic install LSP servers if they are not installed when opening a new buffer.

				--------------------------------------
				-- Automatic run LSP_server.setup() --
				--------------------------------------
				require("mason-lspconfig").setup_handlers {
					function(server_name)
						require("lspconfig")[server_name].setup { capabilities = capabilities }
					end,

					-----------------------------------------
					-- Individual LSP server configuration --
					-----------------------------------------
					-- please read :h mason-lspconfig-automatic-server-setup for more details --

					-- Next, you can provide a dedicated handler for specific servers.
					-- For example, a handler override for the `rust_analyzer`:
					-- ["rust_analyzer"] = function ()
					-- 	require("rust-tools").setup {}
					-- end
				}
			}
		end
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				'nvim-telescope/telescope.nvim',
				'saghen/blink.cmp'
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
		-- Otherwise, please configure each server in mason-lspconfig to avoid the setup --
		-- being called twice.                                                           --
		-----------------------------------------------------------------------------------
		config = function()
			local lsp = require("lspconfig")
			lsp.gdscript.setup {}
			lsp.gdshader_lsp.setup {}

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(args)
					local c = vim.lsp.get_client_by_id(args.data.client_id)
					if not c then return end -- Returns if no LSP is attached

					-----------------------------------
					-- Keybinds when LSP is attached --
					-----------------------------------
					vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end,
						{ desc = "LSP | Format the current buffer" })
					vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', { desc = "LSP | Go to References" })
					vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>',
						{ desc = "LSP | Go to Implementations" })
					vim.keymap.set('n', 'gD', '<cmd>Telescope lsp_definitions<cr>', { desc = "LSP | Go to Definition" })
					vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>',
						{ desc = "LSP | Go to Type Definition" })
					vim.keymap.set('n', '<leader>ss', '<cmd>Telescope lsp_document_symbols<cr>',
						{ desc = "LSP | Document Symbols" })
				end,
			})
		end
	}
}
