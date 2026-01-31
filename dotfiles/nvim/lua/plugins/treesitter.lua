return {
	{
		'nvim-treesitter/nvim-treesitter',
		lazy = false,
		build = ':TSUpdate',
		config = function ()
			local parsers = {
				"bash",
				"gdscript",
				"gdshader",
				"godot_resource",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"diff",
				"gitcommit",
				"git_rebase",
				"gitignore",
				"comment",
				"ledger",
				"csv",
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

			-- Enable highlight
			vim.api.nvim_create_autocmd('FileType', {
				pattern = parsers,
				callback = function() vim.treesitter.start() end,
			})

			-- -- Clunky implementation of autoinstall of parsers
			-- -- and enable Treesitter highlight
			-- -- Removing it since it didn't worked as expected --
			-- vim.api.nvim_create_autocmd('FileType', {
			-- 	callback = function (args)
			-- 		local filetype = args.match
			--
			-- 		-- you need some mechanism to avoid running on buffers that do not
			-- 		-- correspond to a language (like oil.nvim buffers), this implementation
			-- 		-- checks if a parser exists for the current language
			-- 		local language = vim.treesitter.language.get_lang(filetype) or filetype
			-- 		if not vim.treesitter.language.add(language) then
			-- 			return
			-- 		end
			--
			-- 		treesitter.install(filetype)
			-- 		vim.treesitter.start()
			-- 	end
			--
			-- })

			-------------
			-- Keymaps --
			-------------
			vim.keymap.set("n", "<leader>t", "<nop>") -- Disables this keympap (treesitter symbols) to not conflict with my keymaps
		end

	},
	-- TODO fixthis
	{
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			branch = "main",
			init = function()
				-- Disable entire built-in ftplugin mappings to avoid conflicts.
				-- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
				vim.g.no_plugin_maps = true
			end,
			config = function()
				require("nvim-treesitter-textobjects").setup {
					select = {
						-- Automatically jump forward to textobj, similar to targets.vim (similar how neovim works with other textobjects)
						lookahead = true,
						selection_modes = {
							['@parameter.outer'] = 'v', -- charwise
							['@function.outer'] = 'V', -- linewise
						},
						include_surrounding_whitespace = false,
					},
				}

				-------------
				-- Keymaps --
				-------------
				vim.keymap.set({ "x", "o" }, "af", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.outer", "textobjects") end, { desc = "Around Function"})
				vim.keymap.set({ "x", "o" }, "if", function() require "nvim-treesitter-textobjects.select".select_textobject("@function.inner", "textobjects") end, { desc = "Inside Function"})
				vim.keymap.set({ "x", "o" }, "ac", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.outer", "textobjects") end, { desc = "Around Class"})
				vim.keymap.set({ "x", "o" }, "ic", function() require "nvim-treesitter-textobjects.select".select_textobject("@class.inner", "textobjects") end, { desc = "Inside Class"})
				vim.keymap.set({ "x", "o" }, "as", function() require "nvim-treesitter-textobjects.select".select_textobject("@local.scope", "locals") end, { desc = "Around Scope"})
			end,
		}
	}
}
