return {
	{
		'shortcuts/no-neck-pain.nvim',
		version = "*",
		buffers = {
			scratchPad = {
				enabled = false,
			},
		},
		config = function ()
			vim.keymap.set("n", "<leader>tc", function() vim.cmd([[NoNeckPain]]) end, { desc = "Toggle Centralized Buffer (NoNeckPain)" })
		end
	}
}
