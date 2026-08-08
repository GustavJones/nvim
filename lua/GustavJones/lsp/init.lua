vim.lsp.config["lua_ls"] = require("GustavJones.lsp.lua_ls")
vim.lsp.config["clangd"] = require("GustavJones.lsp.clangd")
vim.lsp.config["jdtls"] = require("GustavJones.lsp.jdtls")
vim.lsp.config["pyright"] = require("GustavJones.lsp.pyright")

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("jdtls")
vim.lsp.enable("pyright")

vim.lsp.inlay_hint.enable(true)
vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd(
	"LspAttach",
	{
		callback = function(ev)
			local client = vim.lsp.get_client_by_id(ev.data.client_id)
			if client ~= nil and client:supports_method("textDocument/completion") then
				vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			end
		end,
	}
)
