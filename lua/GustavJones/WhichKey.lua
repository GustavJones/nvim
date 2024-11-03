return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	config = function()
		local whichkey = require("which-key")

		whichkey.register({
			["<leader>t"] = { name = "Telescope" },
			["<leader>c"] = { name = "Code" },
			["<leader>r"] = { name = "Rename" },
			["<leader>g"] = { name = "Git" },
			["<leader>d"] = { name = "Debugging" },
			["<leader>b"] = { name = "Buffers" },
			["<leader>"] = { name = "Leader commands" },
			["["] = { name = "Snippet jump to start" },
			["]"] = { name = "Snippet jump to end" },
			["K"] = { name = "Open information under cursor" },
			["g"] = { name = "Goto" },
			["d"] = { name = "Delete" },
			["z"] = { name = "Folding" },
		})
	end,
}
