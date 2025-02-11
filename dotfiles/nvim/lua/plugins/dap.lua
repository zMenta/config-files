return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"leoluz/nvim-dap-go", -- Configures DAP to be used with go
			"nvim-neotest/nvim-nio", -- required for dap UI
			"williamboman/mason.nvim", -- Mason for easy DAP servers download
		},
		config = function()
			local dap = require "dap"
			local ui = require "dapui"

			require("dapui").setup()
			require("dap-go").setup()
			require("nvim-dap-virtual-text").setup()

			-------------
			-- Keymaps --
			-------------
			vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, { desc = "Dap Toggle Breakpoint" })
			vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "Dap run code until the cursor" })

			-- Eval var under cursor
			vim.keymap.set("n", "<space>de", function()
				require("dapui").eval(nil, { enter = true })
			end, { desc = "Dap Evaluate Expression" })

			vim.keymap.set("n", "<F1>", dap.continue, { desc = "Dap Continues" })
			vim.keymap.set("n", "<F2>", dap.step_into, { desc = "Dap Step Into" })
			vim.keymap.set("n", "<F3>", dap.step_over, { desc = "Dap Step Over" })
			vim.keymap.set("n", "<F4>", dap.step_out, { desc = "Dap Step Out" })
			vim.keymap.set("n", "<F5>", dap.step_back, { desc = "Dap Step Back" })
			vim.keymap.set("n", "<F12>", dap.restart, { desc = "Dap Restart" })

			------------------
			-- Godot Config --
			------------------
			-- In Godot settings check if the port matches:
			--    Editor -> Editor Settings -> Debug Adapter, under Network section.
			dap.adapters.godot = {
				type = "server",
				host = '127.0.0.1',
				port = 6006,
			}

			dap.configurations.gdscript = {
				{
					type = "godot",
					request = "launch",
					name = "Launch scene",
					project = "${workspaceFolder}",
					launch_scene = true,
				}
			}

			-----------------
			-- Bash Config --
			-----------------
			dap.adapters.bashdb = {
				type = 'executable',
				command = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/bash-debug-adapter',
				name = 'bashdb',
			}
			dap.configurations.sh = {
				{
					type = 'bashdb',
					request = 'launch',
					name = "Launch file",
					showDebugOutput = true,
					pathBashdb = vim.fn.stdpath("data") ..
					'/mason/packages/bash-debug-adapter/extension/bashdb_dir/bashdb',
					pathBashdbLib = vim.fn.stdpath("data") .. '/mason/packages/bash-debug-adapter/extension/bashdb_dir',
					trace = true,
					file = "${file}",
					program = "${file}",
					cwd = '${workspaceFolder}',
					pathCat = "cat",
					pathBash = "/bin/bash",
					pathMkfifo = "mkfifo",
					pathPkill = "pkill",
					args = {},
					env = {},
					terminalKind = "integrated",
				}
			}

			-- Opens and closes dapui, dap  automatically when dap is started or terminated
			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}

