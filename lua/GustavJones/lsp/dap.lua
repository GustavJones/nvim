return {
	"rcarriga/nvim-dap-ui",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"jay-babu/mason-nvim-dap.nvim",
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
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

		vim.keymap.set("n", "<leader>da", function()
			local arguments = vim.fn.input("Arguments: ", "", "file")

			function SplitString(inputstr, sep)
				if sep == nil then
					sep = "%s"
				end
				local t = {}
				for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
					table.insert(t, str)
				end
				return t
			end

			for ft, configs in pairs(dap.configurations) do
				for _, config in ipairs(configs) do
					config.args = SplitString(arguments, " ")
				end
			end

			dap.continue()
		end, { desc = "Continue with Arguments", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>do", function()
			dap.step_over()
		end, { desc = "Step Over", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>di", function()
			dap.step_into()
		end, { desc = "Step Into", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>du", function()
			dap.step_out()
		end, { desc = "Step Out", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>dl", function()
			dap.run_last()
		end, { desc = "Run Last Debug session", noremap = true, silent = true })

		vim.keymap.set("n", "<leader>de", function()
			dap.terminate()
		end, { desc = "Exit Debug session", noremap = true, silent = true })

		mason_dap.setup({
			ensure_installed = { "cppdbg", "javadbg", "kotlin", "python" },
			automatic_installation = true,
			handlers = {},
		})
	end,
}
