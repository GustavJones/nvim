return {
	"rcarriga/nvim-dap-ui",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		"mfussenegger/nvim-dap",
	},
	config = function()
		local dapui = require("dapui")
		local dap = require("dap")
		local mason_dap = require("mason-nvim-dap")
		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dd", function()
			dapui.toggle()
		end, { desc = "Toggle Dap UI", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>dt", function()
			dap.toggle_breakpoint()
		end, { desc = "Toggle Breakpoint", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>dc", function()
			dap.continue()
		end, { desc = "Continue", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>do", function()
			dap.step_over()
		end, { desc = "Step Over", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>di", function()
			dap.step_into()
		end, { desc = "Step Into", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>du", function()
			dap.step_out()
		end, { desc = "Step Out", noremap = true, silent = true })

		mason_dap.setup({
			ensure_installed = { "stylua", "cpptools" },
			automatic_installation = true,
			handlers = {},
		})
	end,
}
