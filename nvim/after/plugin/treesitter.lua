require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the four listed parsers should always be installed)
  ensure_installed = { "lua", "help", "gdscript", "godot_resource" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,


  highlight = {
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}


-- Enable tree-sitter code folding 
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false -- Disable automatic file folding when open.


-- Workaround for tree-sitter fold not working on startup with a file. 
-- Problem: Telescope bugs tree-sitter
-- Source: https://github.com/nvim-telescope/telescope.nvim/issues/699#issuecomment-1159637962
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zx", }) 

-- Workaround for foldenable not working.
-- Also added the command zR to unfold all fold. Since foldenable don't seem to work.
vim.api.nvim_create_autocmd({ "BufEnter" }, { pattern = { "*" }, command = "normal zR", }) 

