return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	config = function()
		local whichkey = require("which-key")

		whichkey.register(
		{
			["<leader>t"] = {name = "Telescope"},
      ["<leader>c"] = {name = "Code"},
      ["<leader>r"] = {name = "Rename"},
      ["<leader>g"] = {name = "Git"},
		}
		)

	end
}
