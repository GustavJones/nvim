return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	config = function()
		local whichkey = require("which-key")

		whichkey.add({
			{ "<leader>", group = "Leader commands" },
			{ "<leader>b", group = "Buffers" },
			{ "<leader>c", group = "Code" },
			{ "<leader>d", group = "Debugging" },
			{ "<leader>dw", group = "Debugging Watches" },
			{ "<leader>g", group = "Git" },
			{ "<leader>r", group = "Rename" },
			{ "<leader>t", group = "Telescope" },
			{ "K", group = "Open information under cursor" },
			{ "[", group = "Snippet jump to start" },
			{ "]", group = "Snippet jump to end" },
			{ "d", group = "Delete" },
			{ "g", group = "Goto" },
			{ "z", group = "Folding" },
		})
	end,
}
