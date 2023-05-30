local lsp = require('lsp-zero').preset({"recommended"})


lsp.ensure_installed({})


lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

end)

------------------
-- GODOT Config --
------------------
local lsp_flags = { debounce_text_changes = 150, }

require'lspconfig'.gdscript.setup{
	on_attach = on_attach,
	flags = lsp_flags,
	filetypes = { "gd", "gdscript", "gdscript3" },
}

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
