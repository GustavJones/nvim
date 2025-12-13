return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile", "VeryLazy" },
	lazy = true,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{ "antosha417/nvim-lsp-file-operations", config = true },
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = {
				"lua_ls",
				"emmet_language_server",
				"html",
				"cssls",
				"clangd",
				"cmake",
				"neocmake",
				"marksman",
				"kotlin_language_server",
				-- "jedi_language_server",
				"asm_lsp",
				"pyright",
				"sqlls",
				"taplo",
				"csharp_ls",
				"ts_ls",
				"bashls",
        "gopls",
			},

			automatic_installation = true,
			automatic_enable = false,
		})

		local opts = { noremap = true, silent = true }

		local keymap = vim.keymap

		local on_attach = function(client, bufnr)
			opts.desc = "Show LSP references"
			keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

			opts.desc = "See signature help"
			keymap.set({ "n", "v" }, "<leader>cs", vim.lsp.buf.signature_help, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

			opts.desc = "Show buffer diagnostics"
			keymap.set("n", "<leader>cD", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>cd", vim.diagnostic.open_float, opts) -- show diagnostics for line

			opts.desc = "Go to previous diagnostic"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

			opts.desc = "Go to next diagnostic"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>cr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
		end

		local capabilities = cmp_nvim_lsp.default_capabilities()

		capabilities.textDocument.foldingRange = {
			dynamicRegistration = false,
			lineFoldingOnly = true,
		}

		local custom_lsp_setups = {
			["asm_lsp"] = function()
				vim.lsp.config("asm_lsp", {
					capabilities = capabilities,
					on_attach = on_attach,
					root_dir = lspconfig.util.root_pattern("*.asm", ".git"),
				})
			end,
			["lua_ls"] = function()
				vim.lsp.config("lua_ls", {
					capabilities = capabilities,
					on_attach = on_attach,
					settings = { -- custom settings for lua
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim" },
							},
							workspace = {
								-- make language server aware of runtime files
								library = {
									[vim.fn.expand("$VIMRUNTIME/lua")] = true,
									[vim.fn.stdpath("config") .. "/lua"] = true,
								},
							},
						},
					},
				})
			end,
			["pyright"] = function()
				vim.lsp.config("pyright", {
					capabilities = capabilities,
					on_attach = on_attach,
					cmd = { "pyright-langserver", "--stdio" },
					filetypes = { "python" },
					root_markers = {
						"pyrightconfig.json",
						"pyproject.toml",
						"setup.py",
						"setup.cfg",
						"requirements.txt",
						"Pipfile",
						".git",
					},
					settings = {
						-- Settings at https://microsoft.github.io/pyright/#/settings
						python = {
							pythonPath = ".venv/bin/python",
							analysis = {
								autoSearchPaths = true,
								useLibraryCodeForTypes = true,
								diagnosticMode = "workspace",
								typeCheckingMode = "strict",
							},
						},
					},
				})
			end,
			["dcmls"] = function()
				vim.lsp.config("dcmls", {
					capabilities = capabilities,
					on_attach = on_attach,
					cmd = { "dcm", "start-server", "--client=neovim" },
					filetypes = { "dart" },
					root_markers = { "pubspec.yaml" },
				})
			end,
		}

		local installed_lsp_servers = mason_lspconfig.get_installed_servers()

		for i = 1, #installed_lsp_servers do
			if custom_lsp_setups[installed_lsp_servers[i]] then
				custom_lsp_setups[installed_lsp_servers[i]]()
			else
				vim.lsp.config(installed_lsp_servers[i], {
					capabilities = capabilities,
					on_attach = on_attach,
				})

				-- lspconfig[installed_lsp_servers[i]].setup({
				-- 	capabilities = capabilities,
				-- 	on_attach = on_attach,
				-- })
			end

			vim.lsp.enable(installed_lsp_servers[i], true)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				local client = vim.lsp.get_client_by_id(args.data.client_id)
				if client and client.server_capabilities.inlayHintProvider then
					vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
				end
			end,
		})
	end,
}
