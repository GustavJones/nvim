local lsp_servers = MASON_REGISTRY.get_installed_package_names()

for _, name in ipairs(lsp_servers) do
	local ok, result = pcall(require, "GustavJones.lsp."..name)

	if ok then
		vim.lsp.config[name] = result;
		vim.lsp.enable(name)
	end
end

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
