return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function ()
		local parsers = { "bash", "lua", "gdscript", "gdshader", "markdown", "markdown_inline", "python"}
		local treesitter = require("nvim-treesitter")

		treesitter.install(parsers)

		-- Indentations
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

		-- Folds
		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo[0][0].foldmethod = 'expr'
		-- Make the file unfolded as default
		vim.api.nvim_command("set nofoldenable")

		-- Highlight
		vim.api.nvim_create_autocmd('FileType', {
			pattern = parsers,
			callback = function() vim.treesitter.start() end,
		})

		-------------
		-- Keymaps --
		-------------
		vim.keymap.set("n", "<leader>t", "<nop>") -- Disables this keympap (treesitter symbols) to not conflict with my keymaps
	end
}
