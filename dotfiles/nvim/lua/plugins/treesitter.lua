return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require 'nvim-treesitter.configs'.setup {
				ensure_installed = { "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "gdscript", "gdshader" },
				auto_install = true, -- Automatically install missing parsers when entering buffer
				highlight = {
					enable = true,
					-- Function to disable slow treesitter highlight for large files. TLDR: Disable treesitter highlight in large files
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
					additional_vim_regex_highlighting = false,

					-------------
					-- Keymaps --
					-------------
					vim.keymap.set("n", "<leader>t", "<nop>") -- Disables this keympa (treesitter symbols) to not conflict with my keymaps
				},
			}
		end
	}
}
