local lsp = require('lsp-zero').preset({
  name = 'minimal',
  set_lsp_keymaps = true,
  manage_nvim_cmp = true,
  suggest_lsp_servers = false,
})

-- (Optional) Configure lua language server for neovim
lsp.nvim_workspace()

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Optional Mappings enabled only when lsp connects.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	---------------------
	--     Keymaps     --
	---------------------
	 vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration, bufopts) -- Code Declaration
	 vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition, bufopts) -- Code Definition
	 vim.keymap.set('n', '<leader>ck', vim.lsp.buf.hover, bufopts) -- Code look documentation
	 vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation, bufopts) -- Code Implementation
	 vim.keymap.set('n', '<leader>cs', vim.lsp.buf.signature_help, bufopts) -- Code Signature help
	--  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	--  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	--  vim.keymap.set('n', '<space>wl', function()
	--    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	--  end, bufopts)
	-- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	 vim.keymap.set('n', '<leader>cr', vim.lsp.buf.rename, bufopts) -- lsp code rename
	 vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts) -- code actions
	 vim.keymap.set('n', '<leader>cR', vim.lsp.buf.references, bufopts) -- code references
	 vim.keymap.set('n', '<leader>cf', function() vim.lsp.buf.format { async = true } end, bufopts) -- code format
	----------------------

	local _notify = client.notify
	client.notify = function (method, params)
		if method == 'textDocument/didClose' then
			-- Godot doesn't implement didClose yet
			return
		end
		_notify(method, params)
	end
end


local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require'lspconfig'.gdscript.setup{
	on_attach = on_attach,
	flags = lsp_flags,
	filetypes = { "gd", "gdscript", "gdscript3" },
}

lsp.setup()
