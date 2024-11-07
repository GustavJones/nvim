return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")

		mason.setup()

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"emmet_language_server",
				"html",
				"cssls",
				"clangd",
				"cmake",
				"neocmake",
				"jdtls",
				"marksman",
				"kotlin_language_server",
				"jedi_language_server",
				"asm_lsp",
				"pyright",
				"sqlls",
			},
			automatic_installation = true,
		})
	end,
}
