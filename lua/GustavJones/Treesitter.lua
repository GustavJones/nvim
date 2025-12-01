return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",

	config = function()
		require("nvim-treesitter.configs").setup {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "c", "cpp", "cmake", "lua", "vim", "vimdoc", "query", "lua" },

    indent = true,

    autotag = { enable = true },

    sync_install = false,

    auto_install = true,

    highlight = {
        enable = true,

    },
		}
	end,
}
