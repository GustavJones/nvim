return {
	"ptdewey/yankbank-nvim",
	config = function()
    vim.keymap.set("n", "p", "<cmd>YankBank<CR>", { desc = "Put", noremap = true, silent = true })

		require("yankbank").setup({
			max_entries = 10,
			sep = "-----",
			num_behavior = "jump",
			focus_gain_poll = true,
			keymaps = {
				paste = "<CR>",
				paste_back = "P",
			},
			registers = {
				yank_register = "+",
			},
		})
	end,
}
