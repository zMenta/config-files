return {
	'nvim-treesitter/nvim-treesitter',
	lazy = false,
	build = ':TSUpdate',
	config = function ()
		local parsers = {
			"bash",
			"gdscript",
			"gdshader",
			"markdown",
			"markdown_inline",
			"python",
			-- Treesitter recommended parsers
			"lua",
			"c",
			"vim",
			"vimdoc",
			"query"
		}
		local treesitter = require("nvim-treesitter")

		treesitter.install(parsers)

		-- Enable Treesitter Indentations
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

		-- Enable Treesitter Folds
		vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
		vim.wo[0][0].foldmethod = 'expr'
		-- Make the file unfolded as default
		vim.api.nvim_command("set nofoldenable")

		-- Clunky implementation of autoinstall of parsers
		-- and enable Treesitter highlight
		vim.api.nvim_create_autocmd('FileType', {
			callback = function (args)
				local filetype = args.match

				-- you need some mechanism to avoid running on buffers that do not
				-- correspond to a language (like oil.nvim buffers), this implementation
				-- checks if a parser exists for the current language
				local language = vim.treesitter.language.get_lang(filetype) or filetype
				if not vim.treesitter.language.add(language) then
					return
				end

				treesitter.install(filetype)
				vim.treesitter.start()
			end
		})

		-------------
		-- Keymaps --
		-------------
		vim.keymap.set("n", "<leader>t", "<nop>") -- Disables this keympap (treesitter symbols) to not conflict with my keymaps
	end
}
