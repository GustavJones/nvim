return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		vim.keymap.set("n", "<leader>tt", function()
			vim.cmd.Telescope()
		end, { desc = "Open Telescope", noremap = true, silent = true })
	end,
}
