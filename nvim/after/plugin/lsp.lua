local lsp = require('lsp-zero').preset({"recommended"})


lsp.ensure_installed({
	"lua_ls"
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

end)

----------------
-- cmp Config --
----------------
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- <CR> = enter/return key.
  ["<C-Space>"] = cmp.mapping.complete(),
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

-- lua config --
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

------------------
-- Godot Config --
------------------
local lsp_flags = { debounce_text_changes = 150, }

require'lspconfig'.gdscript.setup{
	flags = lsp_flags,
	-- filetypes = { "gd", "gdscript", "gdscript3" },
}

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
