local lsp = require('lsp-zero').preset({"recommended"})


lsp.ensure_installed({
	"lua_ls", -- Lua
    "bashls", -- Bash
    "rust_analyzer", -- Rust
})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})

  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer = bufnr, desc = "LSP | Go to References"})
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_implementations<cr>', {buffer = bufnr, desc = "LSP | Go to Implementations"})
  vim.keymap.set('n', 'gD', '<cmd>Telescope lsp_definitions<cr>', {buffer = bufnr, desc = "LSP | Go to Definition"})
  vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<cr>', {buffer = bufnr, desc = "LSP | Go to Type Definition"})
  vim.keymap.set('n', '<leader>ss', '<cmd>Telescope lsp_document_symbols<cr>', {buffer = bufnr, desc = "LSP | Document Symbols"})
end)

----------------
-- cmp Config --
----------------
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Shift-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
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

-----------------
-- Rust Config --
-----------------
require("lspconfig").rust_analyzer.setup({
    filetypes = {"rust"},
    root_dir = require("lspconfig/util").root_pattern("Cargo.toml"),
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                allFeatures = true,
            },
        },
    },
})
