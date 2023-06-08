require("nvim-dap-virtual-text").setup()
local dap, dapui = require("dap"), require("dapui")

dapui.setup()

vim.keymap.set("n", "<F7>", ":lua require'dap'.continue()<CR>", {desc = "Dap continue"})
vim.keymap.set("n", "<F8>", ":lua require'dap'.step_into()<CR>", {desc = "Dap step into"})
vim.keymap.set("n", "<F9>", ":lua require'dap'.step_over()<CR>", {desc = "Dap step over"})
vim.keymap.set("n", "<F10>", ":lua require'dap'.step_out()<CR>", {desc = "Dap step out"})
vim.keymap.set("n", "<leader>db", ":lua require'dap'.toggle_breakpoint()<CR>", {desc = "Dap toggle breakpoint"})
vim.keymap.set("n", "<leader>dB", ":lua require'dap'.toggle_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", {desc = "Dap toggle conditional breakpoint"})


-- Opens and closes dapui automatically when dap is started or terminated
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end


------------------
-- Godot Config --
------------------
-- In Godot settings check if the port matches:
--    Editor -> Editor Settings -> Debug Adapter under Network section.

dap.adapters.godot = {
	type = "server",
	host = '127.0.0.1',
	port = 6006,
}

-- Extra configuration
-- For more options, check the godot-vscode-plugin README:
-- https://github.com/godotengine/godot-vscode-plugin#gdscript-debugger
dap.configurations.gdscript = {
	{
		type = "godot",
		request = "launch",
		name = "Launch scene",
		project = "${workspaceFolder}",
		launch_scene = true,
	}
}
