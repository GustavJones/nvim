return {
	"echasnovski/mini.indentscope",
	version = "*",
	config = function()
		require("mini.indentscope").setup()
	end,
	event = { "BufReadPre", "BufNewFile" },
}
