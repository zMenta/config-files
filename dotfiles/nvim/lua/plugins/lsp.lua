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
		config = function()
			require('mason-lspconfig').setup{
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
					function (server_name)
						require("lspconfig")[server_name].setup {}
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
			lsp.gdscript.setup{}
			lsp.gdshader_lsp.setup{}
		end
	}
}
