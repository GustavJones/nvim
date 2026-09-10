local functions = require("GustavJones.functions")

local config_dir = functions.get_config_subdirectory("")
local available_packages = MASON_REGISTRY.get_all_package_names()

for name, type in vim.fs.dir(vim.fs.joinpath(config_dir, "lua/GustavJones/lsp")) do
	if type == "file" then
		for _, package in ipairs(available_packages) do
			if package .. ".lua" == name then
				if not (MASON_REGISTRY.is_installed(package)) then
					vim.cmd("MasonInstall " .. package)
				end

				break
			end
		end
	end
end

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
