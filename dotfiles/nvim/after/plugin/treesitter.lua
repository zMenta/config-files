require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "rust", "vim", "vimdoc", "query", "gdscript", "godot_resource" },

  -- Automatically install parser when no parser is found for file.
  auto_install = true,

  highlight = {
    enable = true,
  },
}
