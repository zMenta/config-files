local lsp = require('lsp-zero').preset({})


lsp.ensure_installed({})


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())


------------------
-- GODOT Config --
------------------
local lsp_flags = {
	debounce_text_changes = 150,
}

require'lspconfig'.gdscript.setup{
	-- on_attach = on_attach,
	flags = lsp_flags,
	-- filetypes = { "gd", "gdscript", "gdscript3" },
}


lsp.setup()
